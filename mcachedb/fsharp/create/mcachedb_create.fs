// -------------------------------------------------------------------
//
//	mcachedb_create.fs
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
let write_proc (mc:MemcachedClient) =
  mcache_manipulate.data_put_proc (mc,"t1521","新潟",48238,"1997-4-21");
  mcache_manipulate.data_put_proc (mc,"t1522","長岡",62576,"1997-7-14");
  mcache_manipulate.data_put_proc (mc,"t1523","新発田",59792,"1997-3-17");
  mcache_manipulate.data_put_proc (mc,"t1524","上越",71469,"1997-10-5");
  mcache_manipulate.data_put_proc (mc,"t1525","糸魚川",32852,"1997-9-14");
  mcache_manipulate.data_put_proc (mc,"t1526","加茂",85654,"1997-7-17");
  mcache_manipulate.data_put_proc (mc,"t1527","三条",14255,"1997-1-26");
  mcache_manipulate.data_put_proc (mc,"t1528","佐渡",31251,"1997-5-21");
  mcache_manipulate.data_put_proc (mc,"t1529","柏崎",75128,"1997-7-19");
  mcache_manipulate.data_put_proc (mc,"t1530","村上",28725,"1997-9-12");
  mcache_manipulate.data_put_proc (mc,"t1531","十日町",72564,"1997-3-25");
  mcache_manipulate.data_put_proc (mc,"t1532","五泉",25812,"1997-5-17");
// -------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =

  printfn "*** 開始 ***"

  let serverlist = [|"127.0.0.1:21201" |]

  let pool = SockIOPool.GetInstance()

  pool.SetServers(serverlist)
  pool.Initialize()

  let mc = new MemcachedClient()

  write_proc (mc)

  let keys = [|"t1521";"t1522";"t1523";"t1524";"t1525";"t1526";"t1527";"t1528";"t1529";"t1530";"t1531";"t1532";|]
  display_proc (mc,keys)
//
  pool.Shutdown()
  printfn "*** 終了 ***"
  0
// -------------------------------------------------------------------
