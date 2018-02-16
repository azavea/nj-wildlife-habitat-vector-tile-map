// Read-scope Mapbox Access Token
const MAPBOX_ACCESS_TOKEN = 'pk.eyJ1IjoiZGFuamZvcmQiLCJhIjoiY2pkZ2VieXQzMGtnODJxcGc0ZWN2NGhmciJ9.wl9Q42ad-LclzE9mkoc16A';

// Protocol, hostname, and port for application (e.g. http://localhost:4000/app)
// {HOST}/habitat/ This where the app will look for the individual GeoJSON files.
const HOST = 'http://localhost:4000/app';

// URLs to the tile source TileJSON resources. Supported protocols are http:, https:, and mapbox://<mapid>.
// These should be Mapbox Tilesets created by uploading the MBTiles files in app/tiles/
const TILE_SOURCES = {
  habitatAreas: 'mapbox://danjford.ccm620fv',
  habitatOverview: 'mapbox://danjford.5kxue5mn'
}
