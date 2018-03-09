// ----------------------------------------------------------------
//	text_update.fs
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

  let file_txt = args.[0]

  let id_in = args.[1]
  let population_in = int args.[2]
  printfn "%s\t%d" id_in population_in

  let dict_aa = text_manipulate.m01.text_read_proc (file_txt)

  let dict_aa = text_manipulate.m01.dict_update_proc (dict_aa,id_in,population_in)

  let _ = text_manipulate.m01.text_write_proc (file_txt,dict_aa)

  Console.Error.WriteLine("*** 終了 ***")
  0
// ----------------------------------------------------------------
