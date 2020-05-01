// ---------------------------------------------------------------
//	text_read.ts
//
//					May/01/2020
//
// ---------------------------------------------------------------
var text_manipulate=require ("/var/www/data_base/common/typescript_common/text_manipulate")

// ---------------------------------------------------------------
console.error ("*** 開始 ***")
//
var file_in: string = process.argv[2]

console.log (file_in)

var dict_aa = text_manipulate.text_read_proc (file_in)

text_manipulate.dict_display_proc (dict_aa)

console.error ("*** 終了 ***")
// ---------------------------------------------------------------

