// -------------------------------------------------------------------
//
//	text_delete.fs
//
//					Feb/08/2016
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

  let dict_aa = text_manipulate.text_read_proc (file_txt)

  let _ = dict_aa.Remove (key)

  let _=  text_manipulate.text_write_proc (file_txt,dict_aa)

  printfn "*** 終了 ***"
  0

// ----------------------------------------------------------------
