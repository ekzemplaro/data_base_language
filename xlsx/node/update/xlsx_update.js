#! /usr/bin/nodejs
// ---------------------------------------------------------------
//
//	xlsx_update.js
//
//					Dec/26/2016
//
// ---------------------------------------------------------------
var fs = require('fs')
var node_common = '/var/www/data_base/common/node_common'

var text_manipulate=require (node_common + '/text_manipulate')
var xlsx_manipulate=require (node_common + '/xlsx_manipulate')
// ---------------------------------------------------------------
console.log ("*** 開始 ***")

const xlsx_file = process.argv[2]
const key=process.argv[3]
const population_in=process.argv[4]

console.log (xlsx_file)
console.log (key + "\t" + population_in)

const dict_aa = xlsx_manipulate.xlsx_read_proc (xlsx_file)

if (key in dict_aa)
	{
	const dict_bb = text_manipulate.dict_update_proc (dict_aa,key,population_in)
	xlsx_manipulate.xlsx_write_proc (xlsx_file,dict_bb)
	}

console.log ("*** 終了 ***")
// ---------------------------------------------------------------
