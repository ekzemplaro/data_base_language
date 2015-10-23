// ----------------------------------------------------------------
//
//  read/csv_read.fs
//
//						Aug/06/2011
//
// ----------------------------------------------------------------
open System
open System.Text
open Microsoft.FSharp.Core
open System.IO

// using System.Collections.Generic

// ----------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =

  printfn "*** 開始 ***"

  let file_in = args.[0]


  Console.WriteLine ("file_in = " + file_in);

  let dict_aa = text_manipulate.csv_read_proc (file_in);

  text_manipulate.dict_display_proc (dict_aa);

  printfn ("*** 終了 ***");
  0
// ----------------------------------------------------------------
// ----------------------------------------------------------------
