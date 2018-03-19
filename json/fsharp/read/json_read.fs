// -------------------------------------------------------------------
//
//	json_read.fs
//
//					Mar/09/2018
//
// -------------------------------------------------------------------
open System
open System.IO
open Microsoft.FSharp.Core
open System.Collections
open System.Collections.Generic

open Newtonsoft.Json
// -------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =
  Console.Error.WriteLine("*** 開始 ***")

  let file_in = args.[0]

  let str_json = file_io.m01.file_to_str_proc (file_in)

//  printfn "%s" str_json

  let dict_aa = json_manipulate.m01.json_to_dict_proc (str_json)

  let _ =  text_manipulate.m01.dict_display_proc (dict_aa)

  Console.Error.WriteLine("*** 終了 ***")

  0
// --------------------------------------------------------------------
