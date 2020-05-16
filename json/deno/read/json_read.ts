// ---------------------------------------------------------------
//	json_read.ts
//
//					May/16/2020
//
// ---------------------------------------------------------------
import { readFileStrSync } from "https://deno.land/std/fs/read_file_str.ts"
import { dict_display_proc } from "./text_manipulate.ts"
// ---------------------------------------------------------------
console.log ("*** 開始 ***")

const file_in:string =Deno.args[0]

console.log (file_in)

const json_str:string = readFileStrSync (file_in,{ encoding: "utf8" })

const dict_aa:Object  = JSON.parse (json_str)

dict_display_proc (dict_aa)

console.log ("*** 終了 ***")
// ---------------------------------------------------------------
