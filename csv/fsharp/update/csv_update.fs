// ----------------------------------------------------------------
//	csv_update.cs
//
//						Aug/06/2011
//
// ----------------------------------------------------------------
open System
open System.Text
open Microsoft.FSharp.Core
open System.IO

// ----------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =

  printfn "*** 開始 ***"

  let file_txt = args.[0]

  let id_in = args.[1]
  let population_in = int args.[2]
  printfn "%s\t%d" id_in population_in

  let dict_aa = text_manipulate.csv_read_proc (file_txt)

  let dict_aa = text_manipulate.dict_update_proc (dict_aa,id_in,population_in)

  let _ = text_manipulate.dict_display_proc (dict_aa)

  let _ = text_manipulate.csv_write_proc (file_txt,dict_aa)

  printfn  "*** 終了 ***"
  0
// ----------------------------------------------------------------
