#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	webdav_update.js
//
//					Mar/18/2013
// ---------------------------------------------------------------
var text_manipulate = require('/var/www/data_base/common/node_common/text_manipulate');
var http_manipulate = require('/var/www/data_base/common/node_common/http_manipulate');
// ---------------------------------------------------------------
console.log ("*** 開始 ***");

var id_in=process.argv[2];
var population_in=process.argv[3];

console.log (id_in + "\t" + population_in);

var http = require('http');
url = require('url');

var url_str = 'http://host_dbase:3004/city/tokyo.json';
var options = url.parse (url_str);

var request = http.request(options, function(res) {});

request.end();

request.on('response', function (response)
	{
	console.log('STATUS: ' + response.statusCode);
//  console.log('HEADERS: ' + JSON.stringify(response.headers));
	response.setEncoding('utf8');

	var json_str = "";
	response.on('data', function (chunk)
		{
	console.log('STATUS: ' + response.statusCode);
		json_str += chunk;
//    console.log('BODY: ' + chunk);
		});

	response.on('end', function ()
		{
		var dict_aa = JSON.parse (json_str);

		dict_aa = text_manipulate.dict_update_proc (dict_aa,id_in,population_in);
		text_manipulate.dict_display_proc (dict_aa);

		var string_out = JSON.stringify (dict_aa);
// console.log (string_out);

		http_manipulate.put_proc ('host_dbase',3004,'/city/tokyo.json',string_out);

		console.log ("*** 終了 ***");
		});
	});


// ---------------------------------------------------------------
