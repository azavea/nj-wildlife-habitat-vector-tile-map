import os
from time import sleep

from mapbox import Uploader
service = Uploader()

dir = os.path.dirname(__file__)

tilesets = [
  { 'mapid': 'habitat-areas-2017', 'path': '/app/tiles/habitat-areas.mbtiles' },
  { 'mapid': 'sightings-2017',     'path': '/app/tiles/sightings.mbtiles' },
]

for tileset in tilesets:
    with open(tileset['path'], 'rb') as src:
        print('Uploading:')
        upload_resp = service.upload(src, tileset['mapid'])
        tileset['upload_id'] = upload_resp.json()['id']
        print(upload_resp.json())

def uploads_complete(tileset_list):
    statuses = []
    for tileset in tileset_list:
        statuses.append(service.status(tileset['upload_id']).json()['complete'])
    return all(statuses)

print('Processing uploads... Check status at https://www.mapbox.com/studio/tilesets/')

while not uploads_complete(tilesets):
    sleep(10)

print('Uploads complete!')
