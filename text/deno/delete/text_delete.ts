// ---------------------------------------------------------------
//	text_delete.ts
//
//					May/01/2020
//
// ---------------------------------------------------------------
import { text_read_proc } from "./text_manipulate.ts"
import { text_write_proc } from "./text_manipulate.ts"

// ---------------------------------------------------------------
console.error ("*** 開始 ***")
//
var file_txt:string = Deno.args[0]
var key:string = Deno.args[1]

console.log (file_txt)
console.log (key)

var dict_aa = text_read_proc (file_txt)

if (key in dict_aa)
	{
	delete dict_aa[key]
	text_write_proc (file_txt,dict_aa)
	}

console.error ("*** 終了 ***")

// ---------------------------------------------------------------
