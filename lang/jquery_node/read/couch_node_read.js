#! /usr/local/bin/node
//
//	json_node_read.js
//
//					Dec/20/2010
//
// ---------------------------------------------------------------------
var fs = require("http");

// ---------------------------------------------------------------------
console.log ("Content-type: text/json\n\n");

var http = require('http');
var google = http.createClient(5984, 'cdbd026');
var request = google.request('GET', '/city/cities', {'data': null});
request.end();

request.on('response', function (response)
	{
//	console.log('STATUS: ' + response.statusCode);
//  console.log('HEADERS: ' + JSON.stringify(response.headers));
	response.setEncoding('utf8');
	response.on('data', function (chunk)
		{
console.log ("" + chunk);
		});
	});



// ---------------------------------------------------------------------
