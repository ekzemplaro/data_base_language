// ---------------------------------------------------------------
//	csv_read.ts
//
//					May/05/2020
//
// ---------------------------------------------------------------
var text_manipulate=require ("/var/www/data_base/common/typescript_common/text_manipulate")

// ---------------------------------------------------------------
console.log ("*** 開始 ***")
//
var file_csv: string = process.argv[2]

console.log (file_csv)

var dict_aa: Object = text_manipulate.csv_read_proc (file_csv)

text_manipulate.dict_display_proc (dict_aa)

console.log ("*** 終了 ***")
// ---------------------------------------------------------------

