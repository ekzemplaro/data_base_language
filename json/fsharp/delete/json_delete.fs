// ----------------------------------------------------------------
//	json_delete.fs
//
//						Aug/22/2013
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

  let key = args.[1]
  printfn "%s" key

  let str_json = file_io.file_to_str_proc (file_json)

  let dict_aa = json_manipulate.json_to_dict_proc (str_json)

//  if dict_aa.ContainsKey (key) then
  let _ = dict_aa.Remove (key)

  let _ = text_manipulate.dict_display_proc (dict_aa)

  let str_json_out = JsonConvert.SerializeObject (dict_aa)

  let _ = file_io.file_write_proc (file_json,str_json_out)

  printfn  "*** 終了 ***"
  0

// --------------------------------------------------------------------
