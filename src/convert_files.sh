#!/bin/sh

ogr2ogr -t_srs 'EPSG:4326' -f 'GPKG' ./data/skylands_habitat.gpkg ./data/skylands_v3_3gdb/skylands_v3_3.gdb Envr_hab_ls_v3_3_skylands
ogr2ogr -f 'CSV' ./data/skylands_species.csv ./data/skylands_v3_3gdb/skylands_v3_3.gdb Envr_hab_ls_v3_3_skyland_sp_05