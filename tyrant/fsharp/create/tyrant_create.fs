// -------------------------------------------------------------------
//
//	tyrant_create.fs
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
let write_proc (mc:MemcachedClient) =
  mcache_manipulate.data_put_proc (mc,"t4761","那覇",43851,"1997-4-21");
  mcache_manipulate.data_put_proc (mc,"t4762","宜野湾",57689,"1997-7-14");
  mcache_manipulate.data_put_proc (mc,"t4763","石垣",59792,"1997-3-17");
  mcache_manipulate.data_put_proc (mc,"t4764","浦添",71469,"1997-10-5");
  mcache_manipulate.data_put_proc (mc,"t4765","名護",32852,"1997-9-14");
  mcache_manipulate.data_put_proc (mc,"t4766","糸満",85654,"1997-7-17");
  mcache_manipulate.data_put_proc (mc,"t4767","沖縄",14255,"1997-1-26");
  mcache_manipulate.data_put_proc (mc,"t4768","豊見城",31251,"1997-5-21");
  mcache_manipulate.data_put_proc (mc,"t4769","うるま",75128,"1997-7-19");
// -------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =

  printfn "*** 開始 ***"

  let serverlist = [|"127.0.0.1:1978" |]

  let pool = SockIOPool.GetInstance()

  pool.SetServers(serverlist)
  pool.Initialize()

  let mc = new MemcachedClient()

  write_proc (mc)

  let keys = [|"t4761";"t4762";"t4763";"t4764";"t4765";"t4766";"t4767";"t4768";"t4769";|]
  display_proc (mc,keys)
//
  pool.Shutdown()
  printfn "*** 終了 ***"
  0
// -------------------------------------------------------------------
