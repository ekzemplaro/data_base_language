// ---------------------------------------------------------------
//	json_update.ts
//
//					May/16/2020
//
// ---------------------------------------------------------------
import { readFileStrSync } from "https://deno.land/std/fs/read_file_str.ts"
import { writeFileStrSync } from "https://deno.land/std/fs/write_file_str.ts"
import { dict_update_proc } from "./text_manipulate.ts"
// ---------------------------------------------------------------
console.log ("*** 開始 ***")
var filename:string = Deno.args[0]
var id_in:string = Deno.args[1]
var population_in:number = parseInt(Deno.args[2])

console.log (filename)
console.log (id_in + "\t" + population_in)

const json_str:string = readFileStrSync (filename,{ encoding: "utf8" })
var dict_aa:Object = JSON.parse (json_str)

const dict_bb = dict_update_proc (dict_aa,id_in,population_in)

const json_str_out:string = JSON.stringify(dict_bb)

writeFileStrSync (filename,json_str_out)

console.log ("*** 終了 ***")

// ---------------------------------------------------------------
