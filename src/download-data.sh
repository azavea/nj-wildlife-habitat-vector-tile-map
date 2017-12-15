#!/bin/sh

# create data directory
mkdir -p ./data/downloads
mkdir -p ./data/landscape-project-3-3
mkdir -p ./data/parcels

# download Landscape Project Version 3.3 File Geodatabases from http://www.nj.gov/dep/gis/landscape.html
for region in $(cat ./src/nj-habitat-regions.txt)
do
    wget -P ./data/downloads http://www.state.nj.us/dep/gis/digidownload/zips/landscape/${region}_v3_3gdb.zip
    unzip -d ./data/downloads/${region} ./data/downloads/${region}_v3_3gdb.zip
    mv ./data/downloads/${region}/${region}_v3_3.gdb ./data/landscape-project-3-3/${region}.gdb
done

# download parcel shapefiles from https://njgin.state.nj.us/NJ_NJGINExplorer/IW.jsp?DLayer=Parcels%20by%20County/Muni
for county in $(cat ./src/nj-county-names.txt)
do
    wget -P ./data/downloads http://njgin.state.nj.us/download2/parcels/parcels_shp_${county}.zip
    unzip ./data/downloads/parcels/parcels_shp_${county}.zip -d ./data/parcels/${county}
done
