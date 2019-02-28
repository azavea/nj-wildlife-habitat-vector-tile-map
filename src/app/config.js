// This where the app will look for the individual GeoJSON files.
const HOST = 'https://s3.amazonaws.com/nj-wildlife-demo';

// URLs to the tile source TileJSON resources. Supported protocols are http:, https:, and mapbox://<mapid>.
const TILE_SOURCES = {
  habitatAreas: HOST + '/tiles/nj-habitat-areas/{z}/{x}/{y}.pbf',
  landscapeRegions: HOST + '/tiles/landscape-regions/{z}/{x}/{y}.pbf'
};

const HOST_JSON = 'https://s3.amazonaws.com/nj-wildlife-habitat-vector-tile-map';
