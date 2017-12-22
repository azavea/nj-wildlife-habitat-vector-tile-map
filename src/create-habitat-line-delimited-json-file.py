import os
import fiona
import csv
import json

with open('/usr/local/src/nj-habitat-regions.txt') as f:
    regions = f.readlines()
# you may also want to remove whitespace characters like `\n` at the end of each line
region_list = [region.strip() for region in regions]

for region in region_list:
    # Paths to habitat geopackage and species csv (already converted from FileGDB)
    habitat_path = '/app/data/' + region + '_habitat.gpkg'
    species_path = '/app/data/' + region + '_species.csv'

    # Collection of habitat features with species sightings, organized by LINKID
    habitats = {}

    # Register format drivers with a context manager
    with fiona.drivers():

        # Open the habitat geopackage data
        with fiona.open(path=habitat_path, driver='GPKG') as habitat_data:

            # For each polygon feature in the habitat dataset...
            for feature in habitat_data:

                # The unique LINKID for the feature
                link = str(feature['properties']['LINKID'])

                # If this is a new feature...
                if link not in habitats:
                    # Clean feature data
                    del feature['id']
                    if 'VERSION' in feature['properties']:
                        del feature['properties']['VERSION']
                    if 'HECTARES' in feature['properties']:
                        del feature['properties']['HECTARES']
                    if 'SHAPE_Length' in feature['properties']:
                        del feature['properties']['SHAPE_Length']
                    if 'SHAPE_Area' in feature['properties']:
                        del feature['properties']['SHAPE_Area']
                    if 'SHAPE_Length' in feature['properties']:
                        del feature['properties']['SHAPE_Length']
                    # Add empty list for collecting sightings
                    feature['properties']['species'] = []

                    # Add this feature to the habitats collection under its LINKID
                    habitats[link] = feature

    # Open the species csv data
    with open(file=species_path) as species_data:
        species = csv.reader(species_data)
        headers = next(species, None)

        # Find the indexes of the columns we'll use
        link_index = headers.index('LINKID')
        class_index = headers.index('CLASS')
        comname_index = headers.index('COMNAME')
        sciname_index = headers.index('SCINAME')
        fed_status_index = headers.index('FED_STATUS')
        nj_status_index = headers.index('NJ_STATUS')
        feat_label_index = headers.index('FEAT_LABEL')
        max_year_index = headers.index('MAX_YEAR')
        cnt_soa_index = headers.index('CNT_SOA')
        fha_scdw_index = headers.index('FHA_SCDW')
        fha_tsc_index = headers.index('FHA_TSC')

        # For each row in the species csv data...
        for row in species:
            # Get the LINKID
            link = str(row[link_index])

            # Create a data object for this row
            data = {}

            # Record the important fields
            data['CLASS'] = row[class_index]
            data['SCINAME'] = row[sciname_index]
            data['COMNAME'] = row[comname_index]
            data['FED_STATUS'] = row[fed_status_index]
            data['NJ_STATUS'] = row[nj_status_index]
            data['FEAT_LABEL'] = row[feat_label_index]
            data['MAX_YEAR'] = row[max_year_index]
            data['CNT_SOA'] = row[cnt_soa_index]
            data['FHA_SCDW'] = row[fha_scdw_index]
            data['FHA_TSC'] = row[fha_tsc_index]

            # If this row links to a recorded habitat feature...
            if link in habitats:
                # Add this species row to the habitat feature's list of species
                habitats[link]['properties']['species'].append(data)

    # Write habitats to a line-delimited JSON text file `habitats/features.txt`
    with open('/app/data/features.txt', 'a') as habitat_file:
        # For each habitat feature...
        for habitat in habitats:
            # Write the GeoJSON feature on a new line
            habitat_file.write(json.dumps(habitats[habitat])+'\n')
    
    print('Added %s to features.txt' % region)
