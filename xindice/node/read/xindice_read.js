#! /usr/bin/node
// ---------------------------------------------------------------
//	xindice_read.js
//
//					Jul/19/2012
// ---------------------------------------------------------------
var request = require('request');
var xml2js = require('xml2js');
var text_manipulate = require('/var/www/data_base/common/node_common/text_manipulate');
// ---------------------------------------------------------------
console.log ("*** 開始 ***");

var parser = new xml2js.Parser();

var url_src = 'http://cdbd026:8888/xindice/db/cities/cities';

request.get ({uri:url_src, json: true },function (error, response, body)
	{
	parser.parseString(body)
	});

parser.on ('end', function (result)
	{
	text_manipulate.dict_display_proc (result)
	console.log	("*** 終了 ***")
	});

// ---------------------------------------------------------------
