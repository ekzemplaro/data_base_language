// ----------------------------------------------------------------
//
//	read/text_read.fs
//
//						Mar/09/2018
//
// ----------------------------------------------------------------
open System
open System.IO
open Microsoft.FSharp.Core

// ----------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =
  Console.Error.WriteLine("*** 開始 ***")

  let file_in = args.[0]

  Console.WriteLine ("file_in = " + file_in)

  let dict_aa = text_manipulate.m01.text_read_proc (file_in)

  let _ = text_manipulate.m01.dict_display_proc (dict_aa)

  Console.Error.WriteLine("*** 終了 ***")
  0
// ----------------------------------------------------------------
