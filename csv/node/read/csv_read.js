#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	csv_read.js
//
//					Dec/10/2012
//
// ---------------------------------------------------------------
var fs = require("fs");
var text_manipulate=require ("/var/www/data_base/common/node_common/text_manipulate");

// ---------------------------------------------------------------
console.log ("*** 開始 ***");
//


var fs = require("fs");

var file_in=process.argv[2];

console.log (file_in);

var dict_aa = text_manipulate.csv_read_proc (file_in);

console.log ("*** check pppp ***");

text_manipulate.dict_display_proc (dict_aa);


console.log ("*** 終了 ***");
// ---------------------------------------------------------------

