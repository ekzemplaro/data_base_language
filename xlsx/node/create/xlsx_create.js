#! /usr/bin/nodejs
// ---------------------------------------------------------------
//
//	xlsx_create.js
//
//					Dec/26/2016
//
// ---------------------------------------------------------------
var fs = require("fs")
var node_common = '/var/www/data_base/common/node_common'
var text_manipulate=require (node_common + '/text_manipulate')
var xlsx_manipulate=require (node_common + '/xlsx_manipulate')

var xlsx = require('node-xlsx')

// ---------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2971','奈良',381425,'1950-8-18')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2972','大和高田',831257,'1950-7-15')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2973','大和郡山',652841,'1950-10-2')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2974','天理',531864,'1950-6-22')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2975','橿原',469358,'1950-8-14')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2976','桜井',615792,'1950-9-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2977','五條',398251,'1950-3-21')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2978','御所',532486,'1950-7-26')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2979','生駒',926857,'1950-10-2')
	
	return	dict_aa
}

// ---------------------------------------------------------------
console.log ("*** 開始 ***")

const xlsx_file = process.argv[2]

const dict_aa = data_prepare_proc ()

xlsx_manipulate.xlsx_write_proc (xlsx_file,dict_aa)

console.log ("*** 終了 ***")

// ---------------------------------------------------------------
