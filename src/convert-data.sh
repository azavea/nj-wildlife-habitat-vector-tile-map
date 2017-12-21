# Convert data from FileGDB to open formats
ogr2ogr -t_srs 'EPSG:4326' -f 'GPKG' /app/data/skylands_habitat.gpkg /app/data/skylands_v3_3gdb/skylands_v3_3.gdb Envr_hab_ls_v3_3_skylands
ogr2ogr -f 'CSV' ./data/skylands_species.csv /app/data/skylands_v3_3gdb/skylands_v3_3.gdb Envr_hab_ls_v3_3_skyland_sp_05