#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	webdav_read.js
//
//					Nov/08/2013
// ---------------------------------------------------------------
var text_manipulate = require('/var/www/data_base/common/node_common/text_manipulate');
// ---------------------------------------------------------------
console.log ("*** 開始 ***");

var http = require('http');

var targetUrl = "http://host_dbase:3004/city/tokyo.json";

var req = http.get (targetUrl, function(res) {
	res.setEncoding('utf8');
	res.on ('data', function(json_str) {
		var dict_aa = JSON.parse (json_str);
		text_manipulate.dict_display_proc (dict_aa);
		console.log ("*** 終了 ***");
	});
});

// error handler
req.on('error', function(err) {
  console.log("Error: " + err.message);
});

// ---------------------------------------------------------------
