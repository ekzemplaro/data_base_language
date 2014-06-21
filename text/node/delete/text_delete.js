#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	text_delete.js
//
//					Aug/05/2013
//
// ---------------------------------------------------------------
var fs = require("fs");
var text_manipulate=require ("/var/www/data_base/common/node_common/text_manipulate");


// ---------------------------------------------------------------
console.log ("*** 開始 ***");
//


var file_txt=process.argv[2];
var key=process.argv[3];

console.log (file_txt);
console.log (key);

var dict_aa = text_manipulate.text_read_proc (file_txt);

if (key in dict_aa)
	{
	delete dict_aa[key];
	text_manipulate.text_write_proc (file_txt,dict_aa);
	}

text_manipulate.dict_display_proc (dict_aa);


console.log ("*** 終了 ***");


// ---------------------------------------------------------------
