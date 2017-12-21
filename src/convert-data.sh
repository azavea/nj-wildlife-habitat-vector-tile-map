
for region in $(cat /usr/local/src/nj-habitat-regions.txt)
do
  # Convert data from FileGDB to open formats
  ogr2ogr -overwrite -t_srs 'EPSG:4326' -f 'GPKG' /app/data/${region}_habitat.gpkg /app/data/landscape-project-3-3/${region}.gdb Envr_hab_ls_v3_3_${region}
  ogr2ogr -overwrite -f 'CSV' ./data/${region}_species.csv /app/data/landscape-project-3-3/${region}.gdb Envr_hab_ls_v3_3_${region}_sp_05
done