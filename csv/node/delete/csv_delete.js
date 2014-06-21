#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	csv_delete.js
//
//					Dec/10/2012
//
// ---------------------------------------------------------------
var fs = require("fs");
var text_manipulate=require ("/var/www/data_base/common/node_common/text_manipulate");


// ---------------------------------------------------------------
console.log ("*** 開始 ***");
//


var file_txt=process.argv[2];
var id_in=process.argv[3];

console.log (file_txt);
console.log (id_in);

var dict_aa = text_manipulate.csv_read_proc (file_txt);

delete dict_aa[id_in];


text_manipulate.dict_display_proc (dict_aa);

text_manipulate.csv_write_proc (file_txt,dict_aa);

console.log ("*** 終了 ***");


// ---------------------------------------------------------------
