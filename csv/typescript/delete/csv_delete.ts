// ---------------------------------------------------------------
//	csv_delete.ts
//
//					May/05/2020
//
// ---------------------------------------------------------------
var text_manipulate=require ("/var/www/data_base/common/typescript_common/text_manipulate")

// ---------------------------------------------------------------
console.log ("*** 開始 ***")
//
var file_csv:string = process.argv[2]
var key:string = process.argv[3]

console.log (file_csv)
console.log (key)

var dict_aa: Object = text_manipulate.csv_read_proc (file_csv)

if (key in dict_aa)
	{
	delete dict_aa[key]
	text_manipulate.csv_write_proc (file_csv,dict_aa)
	}

console.log ("*** 終了 ***")

// ---------------------------------------------------------------
