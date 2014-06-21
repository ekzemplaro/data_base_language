// -------------------------------------------------------------------
//
//	redis_update.fs
//
//					Aug/03/2011
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
  let population_in = args.[1]

  printfn "%s" id_in
  printfn "%s" population_in

  let rd = new Redis ("host_dbase",6379)

  redis_manipulate.update_proc (rd,string id_in,int population_in)

  printfn "*** 終了 ***"
  0
// -------------------------------------------------------------------
