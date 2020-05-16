// ---------------------------------------------------------------
//	text_read.ts
//
//					May/16/2020
//
// ---------------------------------------------------------------
import { text_read_proc } from "./text_manipulate.ts"
import { dict_display_proc } from "./text_manipulate.ts"

// ---------------------------------------------------------------
console.error ("*** 開始 ***")
//
var file_in: string = Deno.args[0]

console.log (file_in)

var dict_aa: {[key: string]: any} = text_read_proc (file_in)

dict_display_proc (dict_aa)

console.error ("*** 終了 ***")
// ---------------------------------------------------------------
