#!/bin/bash

# Convert data from FileGDB to open formats

function process_data() {
    echo "PROCESSING ${1} : GPKG"
    ogr2ogr -skipfailure -overwrite -t_srs 'EPSG:4326' -f 'GPKG' /usr/src/gen/${1}_habitat.gpkg /usr/src/gen/landscape-project-3-3/${1}.gdb ${2}
    echo "PROCESSING ${1} : CSV"
    mkdir -p /usr/src/gen/tmp
    rm -r /usr/src/gen/tmp
    ogr2ogr -skipfailure -overwrite -f 'CSV' /usr/src/gen/tmp /usr/src/gen/landscape-project-3-3/${1}.gdb ${3}
    mv /usr/src/gen/tmp/${3}.csv ${1}_species.csv
}

process_data atlantic_coastal Envr_hab_ls_v3_3_coastal Envr_hab_ls_v3_3_coastal_sp_01
process_data delbay Envr_hab_ls_v3_3_delbay Envr_hab_ls_v3_3_delbay_sp_02
process_data piedmont Envr_hab_ls_v3_3_piedmont Envr_hab_ls_v3_3_piedmt_sp_03
process_data pinelands Envr_hab_ls_v3_3_pinelands Envr_hab_ls_v3_3_pineld_sp_04
process_data skylands Envr_hab_ls_v3_3_skylands Envr_hab_ls_v3_3_skyland_sp_05
process_data marine Envr_hab_ls_v3_3_marine Envr_hab_ls_v3_3_marine_sp_06
