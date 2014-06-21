#! /usr/bin/node
// ---------------------------------------------------------------
//	neo4j_read.js
//
//					Aug/30/2012
// ---------------------------------------------------------------
function neo4j_json_display (json_str)
{
	var data = JSON.parse (json_str);

	if ("id" in data)
		{
	var out_str = data.id + "\t";
	out_str  += data.name + "\t";
	out_str += data.population + "\t";
	out_str += data.date_mod;
	console.log (out_str);
		}
}

// ---------------------------------------------------------------
function fetch_row_proc (key)
{

var http = require('http');
var client = http.createClient (7474, 'localhost');
var request = client.request('GET', '/db/data/node/' + key + '/properties', {'data': null});
request.end();

request.on('response', function (response)
	{
//	console.log('STATUS: ' + response.statusCode);
//  console.log('HEADERS: ' + JSON.stringify(response.headers));
	response.setEncoding('utf8');
	response.on('data', function (chunk)
		{
//	console.log('BODY: ' + chunk);
		neo4j_json_display (chunk);
		});
	});
}

// ---------------------------------------------------------------
console.log ("*** 開始 ***");
for (var key=1; key < 10; key++)
	{
	fetch_row_proc (key);
	}
console.log ("*** 終了 ***");
// ---------------------------------------------------------------

