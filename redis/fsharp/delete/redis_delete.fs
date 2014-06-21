// -------------------------------------------------------------------
//
//	redis_delete.fs
//
//					Nov/25/2010
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
  let id_in = args.[0]

  printfn "%s" id_in

  let rd = new Redis ("host_dbase",6379)

  let _ = rd.Remove (id_in)


  printfn "*** 終了 ***"
  0
// -------------------------------------------------------------------
