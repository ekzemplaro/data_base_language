#! /usr/local/bin/node
//
//	master_node_read.js
//
//					Apr/28/2011
//
// ---------------------------------------------------------------------
var fs = require("fs");
var text_manipulate = require('/var/www/data_base/common/node_common/text_manipulate');
// ---------------------------------------------------------------------
console.log ("Content-type: text/json\n\n");


var dict_aa = data_prepare_proc ();

var json_str = JSON.stringify(dict_aa);

console.log (json_str);
//
// ---------------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ();

	dict_aa = text_manipulate.dict_append_proc (dict_aa,421,'仙台',65714,'1988-9-17');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,422,'石巻',24157,'1988-3-15');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,423,'塩竈',68741,'1988-10-2');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,424,'気仙沼',38704,'1988-6-22');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,425,'白石',40352,'1988-8-14');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,426,'名取',60202,'1988-9-12');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,427,'多賀城',30251,'1988-3-21');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,428,'岩沼',50406,'1988-7-26');
	dict_aa = text_manipulate.dict_append_proc (dict_aa,429,'大崎',25807,'1988-10-2');

	return	dict_aa;
}

// ---------------------------------------------------------------------
