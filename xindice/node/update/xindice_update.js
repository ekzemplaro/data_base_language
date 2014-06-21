#! /usr/bin/node
// ---------------------------------------------------------------
//	xindice_update.js
//
//					Jul/19/2012
// ---------------------------------------------------------------
var request = require('request');
var xml2js = require('xml2js');
var text_manipulate = require('/var/www/data_base/common/node_common/text_manipulate');
var xml_manipulate = require('/var/www/data_base/common/node_common/xml_manipulate');
var http_manipulate = require('/var/www/data_base/common/node_common/http_manipulate');
// ---------------------------------------------------------------
console.log ("*** 開始 ***");

var id_in = process.argv[2];
var population_in = process.argv[3];

console.log (id_in + "\t" + population_in);

var parser = new xml2js.Parser();

var url_src = 'http://host_dbase:8888/xindice/db/cities/cities';

request.get ({uri:url_src, json: true },function (error, response, body)
	{
	parser.parseString(body);
	});

parser.on ('end', function (dict_aa)
	{
	dict_aa=text_manipulate.dict_update_proc(dict_aa,id_in,population_in);
	var out_str = xml_manipulate.dict_to_xml_proc(dict_aa);
	http_manipulate.put_proc('host_dbase',8888,'/xindice/db/cities/cities',out_str);
	text_manipulate.dict_display_proc (dict_aa);
	console.log	("*** 終了 ***")
	});

// ---------------------------------------------------------------
