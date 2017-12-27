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
  
  if (feature.geometry) {
    fs.writeFileSync('/app/habitat/' + link + '.json', JSON.stringify(feature));
  }
});