// -------------------------------------------------------------------
//
//	mcached_update.fs
//
//					Aug/03/2011
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

  let serverlist = [|"127.0.0.1:11211" |]

  let pool = SockIOPool.GetInstance()

  pool.SetServers(serverlist)
  pool.Initialize()

  let mc = new MemcachedClient()

  mcache_manipulate.update_proc (mc,id_in,population_in)

  let keys = [|"t1731";"t1732";"t1733";"t1734";"t1735";"t1736";"t1737";"t1738";"t1739";|]
  display_proc (mc,keys)
//
  pool.Shutdown()
  printfn "*** 終了 ***"
  0
// -------------------------------------------------------------------
