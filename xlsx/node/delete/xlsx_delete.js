#! /usr/bin/nodejs
// ---------------------------------------------------------------
//
//	xlsx_delete.js
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

console.log (xlsx_file)
console.log (key)

var dict_aa = xlsx_manipulate.xlsx_read_proc (xlsx_file)

if (key in dict_aa)
	{
	delete dict_aa[key]
	xlsx_manipulate.xlsx_write_proc (xlsx_file,dict_aa)
	}

console.log ("*** 終了 ***")
// ---------------------------------------------------------------
