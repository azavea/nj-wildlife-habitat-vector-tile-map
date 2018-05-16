// Read-scope Mapbox Access Token
const MAPBOX_ACCESS_TOKEN = 'pk.eyJ1Ijoibmp3aWxkbGlmZS1hemF2ZWEiLCJhIjoiY2pnemY2dXQ1MTBocDJ3bGxmdmU5YThzcCJ9.hmeBcIvcdhkCHc3LFZ2zlw';

// This where the app will look for the individual GeoJSON files.
const HOST = 'https://s3.amazonaws.com/nj-wildlife-demo';

// URLs to the tile source TileJSON resources. Supported protocols are http:, https:, and mapbox://<mapid>.
const TILE_SOURCES = {
  habitatAreas: HOST + '/tiles/nj-habitat-areas/{z}/{x}/{y}',
  landscapeRegions: HOST + '/tiles/landscape-regions/{z}/{x}/{y}'

};
