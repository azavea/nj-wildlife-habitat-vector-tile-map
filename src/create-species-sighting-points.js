var readline = require('readline'),
    polylabel = require('@mapbox/polylabel'),
    turf = require('turf'),
    turfRandom = require('@turf/random'),
    turfPointsWithinPolygon = require('@turf/points-within-polygon');

// Read data from stdin and send output to stdout
var rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
  terminal: false
});

// Function to generate random points in a habitat polygon representing species reports
function createRandomLocations(speciesReport, speciesHabitat) {  
  featureBbox = turf.bbox(speciesHabitat) 
  
  points = [];
  var iteration = 0;
  while (points.length < 1) {
    
    randomPoints = turfRandom.randomPoint(10, { bbox: featureBbox });
    
    var polygonFeatureCollection = { type: 'FeatureCollection', features: [speciesHabitat] }
    
    randomPointsInPolygon = turfPointsWithinPolygon(randomPoints, polygonFeatureCollection);
    
    for (var i = 0; i < randomPointsInPolygon.features.length; i++) {
      if (points.length < 1) {
        randomPoint = randomPointsInPolygon.features[i];
        randomPoint.properties = speciesReport;
        points.push(randomPoint);
      }
    }
    if (iteration >= 5) {
      var coordinate = polylabel(speciesHabitat.geometry.coordinates[0], 1.0);
      points.push(turf.point(coordinate));
    }
    iteration++;
  }
  return points;
}

// Process each input GeoJSON
rl.on('line', function (data) {
  feature = JSON.parse(data);
  
  if (feature.properties.species.length > 0) {
    feature.properties.species.map(function(report) {
      var sightings = createRandomLocations(report, feature);
      sightings.map(function(location) {
        console.log(JSON.stringify(location));
      });
    });
  }  
});
