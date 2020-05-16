// ---------------------------------------------------------------
//	text_update.ts
//
//					May/15/2020
//
// ---------------------------------------------------------------
import { text_read_proc } from "./text_manipulate.ts"
import { text_write_proc } from "./text_manipulate.ts"
import { dict_update_proc } from "./text_manipulate.ts"
// ---------------------------------------------------------------
console.error ("*** 開始 ***")
//

var file_txt:string = Deno.args[0]
var key:string = Deno.args[1]
var population_in:number = parseInt(Deno.args[2])

console.log (file_txt)
console.log (key + "\t" + population_in)

var dict_aa = text_read_proc (file_txt)

if (key in dict_aa)
	{
	var dict_aa = dict_update_proc (dict_aa,key,population_in)
	text_write_proc (file_txt,dict_aa)
	}

console.error ("*** 終了 ***")

// ---------------------------------------------------------------
