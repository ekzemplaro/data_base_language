// -------------------------------------------------------------------
//
//	json_read.fs
//
//					Aug/07/2011
//
// -------------------------------------------------------------------
open System
open System.Text
open Microsoft.FSharp.Core
open System.IO
open System.Collections
open System.Collections.Generic

open Newtonsoft.Json
// -------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =

  printfn "*** 開始 ***"

  let file_in = args.[0]

  let str_json = file_io.file_to_str_proc (file_in)

  let dict_aa = json_manipulate.json_to_dict_proc (str_json)

  let _ =  text_manipulate.dict_display_proc (dict_aa)

  printfn "*** 終了 ***"

  0

// --------------------------------------------------------------------
