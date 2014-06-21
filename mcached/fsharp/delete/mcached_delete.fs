// -------------------------------------------------------------------
//
//	mcached_delete.fs
//
//					Mar/15/2012
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

  let serverlist = [|"127.0.0.1:11211" |]

  let pool = SockIOPool.GetInstance()

  pool.SetServers(serverlist)
  pool.Initialize()

  let mc = new MemcachedClient()

  let _ = mc.Delete (key)

  pool.Shutdown()
  printfn "*** 終了 ***"
  0
// -------------------------------------------------------------------
