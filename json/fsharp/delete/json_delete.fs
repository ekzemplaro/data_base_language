// ----------------------------------------------------------------
//	json_delete.fs
//
//					Mar/09/2018
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

  let key = args.[1]
  printfn "%s" key

  let str_json = file_io.m01.file_to_str_proc (file_json)

  let dict_aa = json_manipulate.m01.json_to_dict_proc (str_json)

  let _ = dict_aa.Remove (key)

  let str_json_out = JsonConvert.SerializeObject (dict_aa)

  let _ = file_io.m01.file_write_proc (file_json,str_json_out)

  Console.Error.WriteLine("*** 終了 ***")
  0

// --------------------------------------------------------------------
