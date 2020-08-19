// ---------------------------------------------------------------
//	json_read.ts
//
//					Jul/28/2020
//
// ---------------------------------------------------------------
var fs = require("fs")
var text_manipulate = require('/var/www/data_base/common/typescript_common/text_manipulate')
// ---------------------------------------------------------------
console.error ("*** 開始 ***")

const filename:string =process.argv[2]

console.log (filename)

const json_str:string = fs.readFileSync (filename,'utf8')

const dict_aa:Object  = JSON.parse (json_str)

text_manipulate.dict_display_proc (dict_aa)

console.error ("*** 終了 ***")
// ---------------------------------------------------------------
