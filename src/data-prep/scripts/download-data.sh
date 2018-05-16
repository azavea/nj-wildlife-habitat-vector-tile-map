#!/bin/bash

# create data directory
mkdir -p /usr/src/gen/downloads
mkdir -p /usr/src/gen/landscape-project-3-3
mkdir -p /usr/src/gen/parcels

# download Landscape Project Version 3.3 Regions from http://www.nj.gov/dep/gis/landscape.html
wget -P /usr/src/gen/downloads http://www.nj.gov/dep/gis/digidownload/zips/landscape/landscape_regions_v3_3_gdb.zip
unzip -d /usr/src/gen/downloads/landscape_regions_v3_3 /usr/src/gen/downloads/landscape_regions_v3_3_gdb.zip
mv /usr/src/gen/downloads/landscape_regions_v3_3/landscape_regions.gdb /usr/src/gen/landscape-project-3-3/landscape_regions.gdb

# download Landscape Project Version 3.3 File Geodatabases from http://www.nj.gov/dep/gis/landscape.html
for region in $(cat /usr/src/nj-habitat-regions.txt)
do
    wget -P /usr/src/gen/downloads http://www.state.nj.us/dep/gis/digidownload/zips/landscape/${region}_v3_3gdb.zip
    unzip -d /usr/src/gen/downloads/${region} /usr/src/gen/downloads/${region}_v3_3gdb.zip
    mv /usr/src/gen/downloads/${region}/${region}_v3_3.gdb /usr/src/gen/landscape-project-3-3/${region}.gdb
done
