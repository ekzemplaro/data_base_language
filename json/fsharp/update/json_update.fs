// ----------------------------------------------------------------
//	json_update.fs
//
//					Mar/08/2018
//
// ----------------------------------------------------------------
open System
open System.IO
open Microsoft.FSharp.Core

open Newtonsoft.Json
// ----------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =

  Console.Error.WriteLine("*** 開始 ***")

  let file_json = args.[0]

  let id_in = args.[1]
  let population_in = int args.[2]
  printfn "%s\t%d" id_in population_in

  let str_json = file_io.m01.file_to_str_proc (file_json)

  let dict_aa = json_manipulate.m01.json_to_dict_proc (str_json)

  let dict_aa = text_manipulate.m01.dict_update_proc (dict_aa,id_in,population_in)

  let str_json_out = JsonConvert.SerializeObject (dict_aa)

  let _ = file_io.m01.file_write_proc (file_json,str_json_out)

  Console.Error.WriteLine("*** 終了 ***")
  0

// --------------------------------------------------------------------
