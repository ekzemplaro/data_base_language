#! /usr/bin/ringo
// ------------------------------------------------------------------
//
//	json_read.js
//
//						Dec/27/2013
//
// ------------------------------------------------------------------
var fs= require ("fs");
var text_manipulate = require ('/var/www/data_base/common/ringo_common/text_manipulate.js');
// ------------------------------------------------------------------

print	("*** 開始 ***");

var args = require('system').args;
var file_in = args[1];

var json_str = fs.read (file_in);

var dict_aa = JSON.parse (json_str);

text_manipulate.dict_display_proc (dict_aa);

print	("*** 終了 ***");
// ------------------------------------------------------------------
