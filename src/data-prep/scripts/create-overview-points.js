var readline = require('readline'),
    polylabel = require('@mapbox/polylabel'),
    turf = require('turf');

// Read data from stdin and send output to stdout
var rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
  terminal: false
});

// Process each input GeoJSON
rl.on('line', function (data) {
  feature = JSON.parse(data);
  
  // process feature
  if (feature.geometry) {
    var coordinate = polylabel(feature.geometry.coordinates[0], 1.0);
    var point = turf.point(coordinate);
    
    point.properties = {};
    point.properties.acres = feature.properties.ACRES;
    point.properties.region = feature.properties.REGION;
    point.properties.label = feature.properties.LABEL12;
    point.properties.type = feature.properties.TYPE12;
    point.properties.rank = feature.properties.LNDR;
    
    console.log(JSON.stringify(point)); 
  } else {
    // Something is wrong with this feature. It does not have a shape.
    //console.log(JSON.stringify(feature));
  }
});
