// -------------------------------------------------------------------
//
//	tyrant_update.fs
//
//					Aug/06/2011
//
// -------------------------------------------------------------------
open System
open System.Text
open Microsoft.FSharp.Core
open System.IO

open Memcached.ClientLibrary
open mcached_manipulate
// -------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =

  printfn "*** 開始 ***"
  let id_in = args.[0]
  let population_in = int args.[1]

  printfn "%s" id_in
  printfn "%d" population_in

  let serverlist = [|"127.0.0.1:1978" |]

  let pool = SockIOPool.GetInstance()

  pool.SetServers(serverlist)
  pool.Initialize()

  let mc = new MemcachedClient()

  mcache_manipulate.update_proc (mc,id_in,population_in)

  let keys = [|"t4761";"t4762";"t4763";"t4764";"t4765";"t4766";"t4767";"t4768";"t4769";|]
  display_proc (mc,keys)
//
  pool.Shutdown()
  printfn "*** 終了 ***"
  0
// -------------------------------------------------------------------
