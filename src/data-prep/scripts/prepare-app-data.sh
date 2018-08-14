#!/bin/bash

# Directory for tiles
mkdir -p /usr/src/data/tiles

#Directory for individual habitat files
mkdir -p /usr/src/data/habitat

# Tippecanoe options https://github.com/mapbox/tippecanoe#options

# Habitat Polygon Vector Tiles
# Read habitat features and convert to vector tiles
tippecanoe --read-parallel \
  --no-polygon-splitting \
  -n "NJ Landscape Project Habitat Areas" -A "<a href='http://www.state.nj.us/dep/fgw/ensp/landscape/index.htm'>NJDEP</a>" \
  -l "nj-habitat-areas" -z 14 -Z 12 \
  -f -o /usr/src/data/nj-habitat-areas.mbtiles \
  /usr/src/gen/features.txt

# Export the mbtiles to pbf files
function export-mbtiles() {
    mkdir -p $2
    rm -r $2
    mb-util --image_format=pbf $1 $2;
    pushd $2 && \
        gzip -d -r -S .pbf * && \
        popd;
}

# Landscape Regions Vector Tiles
# Read region features and convert to vector tiles
tippecanoe --read-parallel \
  --no-polygon-splitting \
  -n "NJ Landscape Project Regions" -A "<a href='http://www.state.nj.us/dep/fgw/ensp/landscape/index.htm'>NJDEP</a>" \
  -l "landscape-regions" -z 13 -Z 7 \
  -f -o /usr/src/data/landscape-regions.mbtiles \
  /usr/src/gen/landscape_regions.geojson

# Export the mbtiles to pbf files
export-mbtiles /usr/src/data/landscape-regions.mbtiles /usr/src/data/tiles/landscape-regions
