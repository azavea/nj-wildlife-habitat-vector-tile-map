#!/bin/bash

# create data directory
mkdir -p /usr/src/gen/downloads
mkdir -p /usr/src/gen/landscape-project-3-3
mkdir -p /usr/src/gen/parcels

# download Landscape Project Version 3.3 File Geodatabases from http://www.nj.gov/dep/gis/landscape.html
for region in $(cat /usr/src/nj-habitat-regions.txt)
do
    wget -P /usr/src/gen/downloads http://www.state.nj.us/dep/gis/digidownload/zips/landscape/${region}_v3_3gdb.zip
    unzip -d /usr/src/gen/downloads/${region} /usr/src/gen/downloads/${region}_v3_3gdb.zip
    mv /usr/src/gen/downloads/${region}/${region}_v3_3.gdb /usr/src/gen/landscape-project-3-3/${region}.gdb
done

# download parcel shapefiles from https://njgin.state.nj.us/NJ_NJGINExplorer/IW.jsp?DLayer=Parcels%20by%20County/Muni
#for county in $(cat /usr/local/src/nj-county-names.txt)
#do
#    wget -P /app/data/downloads http://njgin.state.nj.us/download2/parcels/parcels_shp_${county}.zip
#    unzip /app/data/downloads/parcels_shp_${county}.zip -d /app/data/parcels/${county}
#done
