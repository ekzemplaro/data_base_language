// ---------------------------------------------------------------
//	json_delete.ts
//
//					May/16/2020
//
// ---------------------------------------------------------------
import { readFileStrSync } from "https://deno.land/std/fs/read_file_str.ts"
import { writeFileStrSync } from "https://deno.land/std/fs/write_file_str.ts"
// ---------------------------------------------------------------
console.log ("*** 開始 ***")
const filename:string = Deno.args[0]
const key_in:string = Deno.args[1]

console.log (filename)
console.log (key_in)

const json_str:string = readFileStrSync (filename,{ encoding: "utf8" })
var dict_aa:{[key: string]: any} = JSON.parse (json_str)

if (key_in in dict_aa)
	{ 
	delete dict_aa[key_in]

	const json_str_out:string = JSON.stringify(dict_aa)

	writeFileStrSync (filename,json_str_out)
	}

console.log ("*** 終了 ***")

// ---------------------------------------------------------------
