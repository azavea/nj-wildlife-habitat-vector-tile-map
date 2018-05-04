#!/bin/bash

# Directory for tiles
mkdir -p /usr/src/data/tiles

#Directory for individual habitat files
mkdir -p /usr/src/data/habitat

# Tippecanoe options https://github.com/mapbox/tippecanoe#options

# Habitat Polygon Vector Tiles
# Read habitat features and convert to vector tiles
tippecanoe --read-parallel \
  -n "NJ Landscape Project Habitat Areas" -A "<a href='http://www.state.nj.us/dep/fgw/ensp/landscape/index.htm'>NJDEP</a>" \
  -l "nj-habitat-areas" -z 14 -Z 12 \
  -f -o /usr/src/data/nj-habitat-areas.mbtiles \
  /usr/src/gen/features.txt

# Individual Habitat GeoJSON Files
# Save habitat features to individual GeoJSON files named by LINKID
echo 'Writing individual GeoJSON files to /app/habitat/...'
parallel --pipepart -a /usr/src/gen/features.txt node /usr/src/scripts/create-habitat-individual-json-files.js

# Export the mbtiles to pbf files
function export-mbtiles() {
    mkdir -p $2
    rm -r $2
    mb-util --image_format=pbf $1 $2;
    pushd $2 && \
        gzip -d -r -S .pbf * && \
        popd;
}

export-mbtiles /usr/src/data/nj-habitat-areas.mbtiles /usr/src/data/tiles/nj-habitat-areas
