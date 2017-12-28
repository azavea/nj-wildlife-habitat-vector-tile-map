#!/bin/sh

# Directory for tiles
mkdir -p /app/tiles

#Directory for individual habitat files
mkdir -p /app/habitat

# Habitat Polygon Vector Tiles
# Read habitat features and convert to vector tiles
tippecanoe --read-parallel -z 14 -Z 12 -f -o /app/tiles/habitat-areas.mbtiles /app/data/features.txt

# Habitat Point Overview Vector Tiles
# Read habitat features line-by-line in parallel, generate species report points, then convert to vector tiles
parallel --pipepart -a /app/data/features.txt node /usr/local/src/create-overview-points.js | tippecanoe -rg -Z 6 -z 13 -ad -f -o /app/tiles/sightings.mbtiles

# Individual Habitat GeoJSON Files
# Save habitat features to individual GeoJSON files named by LINKID
echo 'Writing individual GeoJSON files to /app/habitat/...'
parallel --pipepart -a /app/data/features.txt node /usr/local/src/create-habitat-individual-json-files.js