#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	json_read.js
//
//					Dec/10/2012
//
// ---------------------------------------------------------------
var fs = require("fs");
var text_manipulate = require('/var/www/data_base/common/node_common/text_manipulate');
// ---------------------------------------------------------------
console.log ("*** 開始 ***");

var filename=process.argv[2];

console.log (filename);

var json_str = fs.readFileSync (filename,'utf8');

var dict_aa = JSON.parse (json_str);

text_manipulate.dict_display_proc (dict_aa);

console.log ("*** 終了 ***");
// ---------------------------------------------------------------

