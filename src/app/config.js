// Read-scope Mapbox Access Token
const MAPBOX_ACCESS_TOKEN = 'pk.eyJ1IjoiZGFuamZvcmQiLCJhIjoiY2pkZ2VieXQzMGtnODJxcGc0ZWN2NGhmciJ9.wl9Q42ad-LclzE9mkoc16A';

// Protocol, hostname, and port for application (e.g. http://localhost:4000/app)
// {HOST}/habitat/ This where the app will look for the individual GeoJSON files.
const HOST = 'http://localhost:8099';

// URLs to the tile source TileJSON resources. Supported protocols are http:, https:, and mapbox://<mapid>.
// These should be Mapbox Tilesets created by uploading the MBTiles files in app/tiles/

// const TILE_SOURCES = {
//   // habitatAreas: 'mapbox://danjford.ccm620fv',
//   habitatAreas: 'http://localhost:8000/tiles/nj-habitat-areas-2/{z}/{x}/{y}.pbf',
//   habitatOverview: 'mapbox://danjford.5kxue5mn'
// };

const TILE_SOURCES = {
    habitatAreas: HOST + '/tiles/nj-habitat-areas-2/{z}/{x}/{y}',
    // habitatAreas: "http://njwildlife.azavea.com/tiles/nj-habitat-areas/{z}/{x}/{y}"
    // habitatRegions: 'http://localhost:8000/tiles/nj-habitat-overview/{z}/{x}/{y}.pbf.pbf'
    // habitatAreas: 'mapbox://danjford.ccm620fv',
    habitatRegions: 'mapbox://danjford.89yecrvp'
};
