#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	text_read.js
//
//					Oct/31/2012
//
// ---------------------------------------------------------------
var fs = require("fs");
var text_manipulate=require ("/var/www/data_base/common/node_common/text_manipulate");

// ---------------------------------------------------------------
console.log ("*** 開始 ***");
//
var file_in=process.argv[2];

console.log (file_in);

var dict_aa = text_manipulate.text_read_proc (file_in);

text_manipulate.dict_display_proc (dict_aa);

console.log ("*** 終了 ***");
// ---------------------------------------------------------------

