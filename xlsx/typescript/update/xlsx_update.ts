// ---------------------------------------------------------------
//
//	xlsx_update.ts
//
//					May/05/2020
//
// ---------------------------------------------------------------
var fs = require('fs')
var node_common = '/var/www/data_base/common/node_common'
var typescript_common = '/var/www/data_base/common/typescript_common'

var text_manipulate=require (typescript_common + '/text_manipulate')
var xlsx_manipulate=require (node_common + '/xlsx_manipulate')
// ---------------------------------------------------------------
console.log ("*** 開始 ***")

var xlsx_file: string = process.argv[2]
var key: string =process.argv[3]
var population_in:number = parseInt(process.argv[4])

console.log (xlsx_file)
console.log (key + "\t" + population_in)


var dict_aa = xlsx_manipulate.xlsx_read_proc (xlsx_file)

if (key in dict_aa)
	{
	var dict_aa = text_manipulate.dict_update_proc (dict_aa,key,population_in)
	xlsx_manipulate.xlsx_write_proc (xlsx_file,dict_aa)
	}

console.log ("*** 終了 ***")
// ---------------------------------------------------------------
