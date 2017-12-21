#!/bin/sh

# Directory for tiles
mkdir -p /app/tiles

#Directory for individual habitat files
mkdir -p /app/habitat

# Habitat Polygon Vector Tiles
# Read habitat features and convert to vector tiles
tippecanoe --read-parallel -z 13 -Z 11 -f -o /app/tiles/habitat-areas.mbtiles ./data/features.txt

# Individual Habitat GeoJSON Files
# Save habitat features to individual GeoJSON files named by LINKID
parallel --pipepart -a ./data/features.txt --block 3M node /usr/local/src/create-habitat-individual-json-files.js

# Habitat Point Overview Vector Tiles
# Read habitat features line-by-line in parallel, generate species report points, then convert to vector tiles
parallel --pipepart -a ./data/features.txt --block 3M node /usr/local/src/create-species-sighting-points.js | tippecanoe -rg -f -o /app/tiles/sightings.mbtiles