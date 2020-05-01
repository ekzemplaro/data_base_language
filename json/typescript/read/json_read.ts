// ---------------------------------------------------------------
//	json_read.ts
//
//					May/01/2020
//
// ---------------------------------------------------------------
var fs = require("fs")
var text_manipulate = require('/var/www/data_base/common/typescript_common/text_manipulate')
// ---------------------------------------------------------------
console.log ("*** 開始 ***")

var filename:string =process.argv[2]

console.log (filename)

var json_str:string = fs.readFileSync (filename,'utf8')

var dict_aa = JSON.parse (json_str)

text_manipulate.dict_display_proc (dict_aa)

console.log ("*** 終了 ***")
// ---------------------------------------------------------------
