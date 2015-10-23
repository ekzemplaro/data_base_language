// -------------------------------------------------------------------
//
//	mcached_create.fs
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
  mcache_manipulate.data_put_proc (mc,"t1731","金沢",58439,"1997-2-8");
  mcache_manipulate.data_put_proc (mc,"t1732","輪島",12576,"1997-5-9");
  mcache_manipulate.data_put_proc (mc,"t1733","小松",54792,"1997-3-17");
  mcache_manipulate.data_put_proc (mc,"t1734","七尾",71469,"1997-10-5");
  mcache_manipulate.data_put_proc (mc,"t1735","珠洲",37852,"1997-9-14");
  mcache_manipulate.data_put_proc (mc,"t1736","加賀",89654,"1997-7-17");
  mcache_manipulate.data_put_proc (mc,"t1737","羽咋",14265,"1997-1-26");
  mcache_manipulate.data_put_proc (mc,"t1738","かほく",37251,"1997-5-21");
  mcache_manipulate.data_put_proc (mc,"t1739","白山",51287,"1997-7-19");
// -------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =

  printfn "*** 開始 ***"

  let serverlist = [|"127.0.0.1:11211" |]

  let pool = SockIOPool.GetInstance()

  pool.SetServers(serverlist)
  pool.Initialize()

  let mc = new MemcachedClient()

  write_proc (mc)

  let keys = [|"t1731";"t1732";"t1733";"t1734";"t1735";"t1736";"t1737";"t1738";"t1739";|]
  display_proc (mc,keys)
//
  pool.Shutdown()
  printfn "*** 終了 ***"
  0
// -------------------------------------------------------------------
