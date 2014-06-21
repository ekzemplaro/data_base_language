// -------------------------------------------------------------------
//
//	tyrant_delete.fs
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
  let key = args.[0]

  printfn "%s" key

  let serverlist = [|"127.0.0.1:1978" |]

  let pool = SockIOPool.GetInstance()

  pool.SetServers(serverlist)
  pool.Initialize()

  let mc = new MemcachedClient()

//  if (mc.KeyExists(key)) then
  let _ = mc.Delete (key)

  let keys = [|"t4761";"t4762";"t4763";"t4764";"t4765";"t4766";"t4767";"t4768";"t4769";|]
  display_proc (mc,keys)
//
  pool.Shutdown()
  printfn "*** 終了 ***"
  0
// -------------------------------------------------------------------
