// -------------------------------------------------------------------
//
//	mcached_manipulate.fs
//
//					Jun/04/2013
//
// -------------------------------------------------------------------
module mcached_manipulate
open System
open System.Text
open Microsoft.FSharp.Core
open System.IO

open Memcached.ClientLibrary
// -------------------------------------------------------------------
let display_proc (mc:MemcachedClient,keys:String[]) =
  for key in keys do
    let str_key = key.ToString ()
    if (mc.KeyExists (str_key)) then
      let json_str = mc.Get(str_key).ToString ()
      if (not (json_str = null)) then
        printfn "%s" json_str
//        kvalue_manipulate.out_record_proc (key,json_str)
    else
      printf "*** not exist ***"
      printfn "%s" str_key
//
    done
// -------------------------------------------------------------------
