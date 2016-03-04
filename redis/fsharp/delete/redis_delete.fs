// -------------------------------------------------------------------
//
//	redis_delete.fs
//
//					Feb/09/2016
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
  let key_in = args.[0]

  printfn "%s" key_in

  let rd = new Redis ("host_dbase",6379)

  let _ = rd.Remove (key_in)

  printfn "*** 終了 ***"
  0
// -------------------------------------------------------------------
