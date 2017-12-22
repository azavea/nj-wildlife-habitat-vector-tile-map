# Convert data from FileGDB to open formats
ogr2ogr -overwrite -t_srs 'EPSG:4326' -f 'GPKG' /app/data/atlantic_coastal_habitat.gpkg /app/data/landscape-project-3-3/atlantic_coastal.gdb Envr_hab_ls_v3_3_coastal
ogr2ogr -overwrite -f 'CSV' /app/data/atlantic_coastal_species.csv /app/data/landscape-project-3-3/atlantic_coastal.gdb Envr_hab_ls_v3_3_coastal_sp_01

ogr2ogr -overwrite -t_srs 'EPSG:4326' -f 'GPKG' /app/data/delbay_habitat.gpkg /app/data/landscape-project-3-3/delbay.gdb Envr_hab_ls_v3_3_delbay
ogr2ogr -overwrite -f 'CSV' /app/data/delbay_species.csv /app/data/landscape-project-3-3/delbay.gdb Envr_hab_ls_v3_3_delbay_sp_02

ogr2ogr -overwrite -t_srs 'EPSG:4326' -f 'GPKG' /app/data/piedmont_habitat.gpkg /app/data/landscape-project-3-3/piedmont.gdb Envr_hab_ls_v3_3_piedmont
ogr2ogr -overwrite -f 'CSV' /app/data/piedmont_species.csv /app/data/landscape-project-3-3/piedmont.gdb Envr_hab_ls_v3_3_piedmt_sp_03

ogr2ogr -overwrite -t_srs 'EPSG:4326' -f 'GPKG' /app/data/pinelands_habitat.gpkg /app/data/landscape-project-3-3/pinelands.gdb Envr_hab_ls_v3_3_pinelands
ogr2ogr -overwrite -f 'CSV' /app/data/pinelands_species.csv /app/data/landscape-project-3-3/pinelands.gdb Envr_hab_ls_v3_3_pineld_sp_04

ogr2ogr -overwrite -t_srs 'EPSG:4326' -f 'GPKG' /app/data/skylands_habitat.gpkg /app/data/landscape-project-3-3/skylands.gdb Envr_hab_ls_v3_3_skylands
ogr2ogr -overwrite -f 'CSV' /app/data/skylands_species.csv /app/data/landscape-project-3-3/skylands.gdb Envr_hab_ls_v3_3_skyland_sp_05

ogr2ogr -overwrite -t_srs 'EPSG:4326' -f 'GPKG' /app/data/marine_habitat.gpkg /app/data/landscape-project-3-3/marine.gdb Envr_hab_ls_v3_3_marine
ogr2ogr -overwrite -f 'CSV' /app/data/marine_species.csv /app/data/landscape-project-3-3/marine.gdb Envr_hab_ls_v3_3_marine_sp_06
