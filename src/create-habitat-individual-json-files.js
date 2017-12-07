var readline = require('readline'),
    polylabel = require('@mapbox/polylabel'),
    turf = require('turf'),
    fs = require('fs'),
    path = require('path');

// Read data from stdin and send output to stdout
var rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
  terminal: false
});

rl.on('line', function (data) {
  feature = JSON.parse(data);
  
  var link = feature.properties['LINKID'];
  
  /* Do stuff to feature. */
  labelCoordinates = polylabel(feature.geometry.coordinates[0], 1.0);
  
  fs.writeFileSync(path.join(__dirname, '..', 'habitat', link + '.json'), JSON.stringify(feature));
});