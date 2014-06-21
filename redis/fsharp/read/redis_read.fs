// -------------------------------------------------------------------
//
//	redis_read.fs
//
//					Jun/04/2013
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

  let rr = new Redis ("host_dbase",6379)

  let keys = ["t1851";"t1852";"t1853";"t1854";"t1855";"t1856";"t1857";"t1858";"t1859";]

  for key in keys do
  if (rr.ContainsKey (key)) then
      let json_str = rr.GetString (key)
//    Console.WriteLine (str_key + "\t" + json_str)
      kvalue_manipulate.out_record_proc (key,json_str);
  done

  printfn "*** 終了 ***"
  0
// -------------------------------------------------------------------
