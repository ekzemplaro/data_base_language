// ----------------------------------------------------------------
//	json_update.fs
//
//					Feb/08/2016
//
// ----------------------------------------------------------------
open System
open System.Text
open Microsoft.FSharp.Core
open System.IO

open Newtonsoft.Json
// ----------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =

  printfn "*** 開始 ***"

  let file_json = args.[0]

  let id_in = args.[1]
  let population_in = int args.[2]
  printfn "%s\t%d" id_in population_in

  let str_json = file_io.file_to_str_proc (file_json)

  let dict_aa = json_manipulate.json_to_dict_proc (str_json)

  let dict_aa = text_manipulate.dict_update_proc (dict_aa,id_in,population_in)

  let str_json_out = JsonConvert.SerializeObject (dict_aa)

  let _ = file_io.file_write_proc (file_json,str_json_out)

  printfn  "*** 終了 ***"
  0

// --------------------------------------------------------------------
