#!/usr/bin/env node

//require modules
var d3 = require('d3');
var fs = require('fs');
var doc = require('jsdom').jsdom();

var inFile = process.argv[2];
var id = process.argv[3];
var idField = process.argv[4];
var nameField = process.argv[5];

console.log(inFile)
console.log(id)
console.log(idField)
console.log(nameField)

if (!inFile || !id || !idField || !nameField) {
  console.error('Usage: svg.js <inFile> <id> <idField> <nameField>');
  process.exit();
}

// read features from a .geojson file
var geo = JSON.parse(fs.readFileSync(inFile, 'utf8'));

// canvas size
var width = 620,
    height = 500;

// setup the projection to fill the canvas
var proj = d3.geo.mercator()
  .center([11.634275, 56.1856])
  .scale(4900)
  .translate([width / 2, height / 2]);
var path = d3.geo.path().projection(proj);

// add custom namespace for dagi attributes
d3.ns.prefix.dagi = 'http://www.information.dk/dagi';

// setup svg element
var map = d3.select(doc.body).html('').append('svg')
  .attr('width', width)
  .attr('height', height)
  .attr('xmlns', 'http://www.w3.org/2000/svg')
  .attr(':xmlns:dagi', 'http://www.information.dk/dagi');

// add wrapper element for the individual paths
var wrapper = map.append('g').attr('id', id);

// add all feature paths to the svg
wrapper.selectAll("path")
  .data(geo.features)
  .enter().append("svg:path")
  .attr("d", path)
  .attr('id', function (d) { return d.properties[idField]; })
  .attr(':dagi:name', function (d) { return d.properties[nameField]; })
  .style('fill', '#f00');

// render the svg to stdout
console.log('<?xml version="1.0" encoding="UTF-8" standalone="no"?>');
console.log(d3.select(doc.body).html());
