// -------------------------------------------------------------------
//
//	riak_read.fs
//
//					Aug/22/2013
//
// -------------------------------------------------------------------
open System
open System.Text
open Microsoft.FSharp.Core
open System.IO
open System.Net
open System.Collections
open System.Collections.Generic

open Newtonsoft.Json
// -------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =

  printfn "*** 開始 ***"

  let url_base = "http://localhost:8098/riak/shimane"
  let url_in = url_base + "?keys=true"

  let user = ""
  let password = ""

  let str_json = get_uri.get_uri_proc (url_in,user,password)

  let data_aa = JsonConvert.DeserializeObject<Dictionary<string,Object>>(str_json)

  printfn "%O" data_aa.["keys"]

//  for key in data_aa.["keys"] do
//    printfn key
//  printfn data_aa.["keys"]
  let json_str_keys = data_aa.["keys"];

//  printfn json_str_keys.AsString ()
//  printfn ToString (json_str_keys)
//  let keys = JsonConvert.DeserializeObject <String[]> (json_str_keys);

//  let _ = text_manipulate.dict_display_proc (dict_aa)

  printfn "*** 終了 ***"

  0

// ------------------------------------------------------------------
