// -------------------------------------------------------------------
//
//	csv_delete.fs
//
//					Jun/03/2011
//
// -------------------------------------------------------------------
open System
open System.Text
open Microsoft.FSharp.Core
open System.IO

// -------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =

  printfn "*** 開始 ***"
  printfn "*** aaaaa ***"

  let file_txt = args.[0]

  let key = args.[1]
  printfn "%s" key

  let dict_aa = text_manipulate.csv_read_proc (file_txt)

  let _ = dict_aa.Remove (key)

  let _ = text_manipulate.dict_display_proc (dict_aa)

  let _=  text_manipulate.csv_write_proc (file_txt,dict_aa)

  printfn "*** 終了 ***"
  0

// ----------------------------------------------------------------
// ----------------------------------------------------------------
