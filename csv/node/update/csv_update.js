#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	text_update.js
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
var population_in=process.argv[4];

console.log (file_txt);
console.log (id_in + "\t" + population_in);

var dict_aa = text_manipulate.csv_read_proc (file_txt);

var dict_bb = text_manipulate.dict_update_proc (dict_aa,id_in,population_in);

text_manipulate.dict_display_proc (dict_bb);

text_manipulate.csv_write_proc (file_txt,dict_bb);

console.log ("*** 終了 ***");


// ---------------------------------------------------------------
