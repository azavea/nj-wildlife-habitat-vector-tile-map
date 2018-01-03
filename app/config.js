// Read-scope Mapbox Access Token
const MAPBOX_ACCESS_TOKEN = 'pk.eyJ1IjoiYWFyb25kZW5uaXMiLCJhIjoiY2piZ3Jxb2h1MWYzdDM0cXdoZ2l0M2FmbSJ9.H7i4tLx_gKCJN-qDoTc8aw';

// Protocol, hostname, and port for application (e.g. http://localhost:4000/app)
// {HOST}/habitat/ This where the app will look for the individual GeoJSON files.
const HOST = 'http://localhost:4000/app';

// URLs to the tile source TileJSON resources. Supported protocols are http:, https:, and mapbox://<mapid>.
// These should be Mapbox Tilesets created by uploading the MBTiles files in app/tiles/
const TILE_SOURCES = {
  habitatAreas: 'mapbox://aarondennis.3tq2eaql',
  habitatOverview: 'mapbox://aarondennis.d5s2i4zb'
}