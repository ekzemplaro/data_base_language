// -------------------------------------------------------------------
//
//	text_delete.fs
//
//					Mar/09/2018
//
// -------------------------------------------------------------------
open System
open System.IO
open Microsoft.FSharp.Core

// -------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =

  Console.Error.WriteLine("*** 開始 ***")

  let file_txt = args.[0]

  let key = args.[1]
  printfn "%s" key

  let dict_aa = text_manipulate.m01.text_read_proc (file_txt)

  let _ = dict_aa.Remove (key)

  let _=  text_manipulate.m01.text_write_proc (file_txt,dict_aa)

  Console.Error.WriteLine("*** 終了 ***")
  0
// ----------------------------------------------------------------
