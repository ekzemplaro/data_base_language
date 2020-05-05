// ---------------------------------------------------------------
//
//	xlsx_read.ts
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

var dict_aa = xlsx_manipulate.xlsx_read_proc (xlsx_file)

text_manipulate.dict_display_proc (dict_aa)

console.log ("*** 終了 ***")
// ---------------------------------------------------------------
