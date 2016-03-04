// ------------------------------------------------------------------
//	couch_delete.fs
//
//					Mar/03/2016
//
// ------------------------------------------------------------------
open System
open System.Text
open Microsoft.FSharp.Core
open System.IO
open System.Net
open System.Collections
open System.Collections.Generic

open Newtonsoft.Json
// -------------------------------------------------------------------
let rev_get_proc (str_json) =
  let unit_aa = JsonConvert.DeserializeObject<Dictionary<string,Object>>(str_json)

  let idx = unit_aa.["_id"].ToString ()
  let revx = unit_aa.["_rev"].ToString ()

  printfn "%s" idx
  printfn "%s" revx

  revx
//
// -------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =

  printfn "*** 開始 ***"
  let key_in = args.[0]

  printfn "%s" key_in

  let url = "http://localhost:5984/nagano"

  let user = ""
  let password = ""

  let url_target = url + "/" + key_in

  try
    let str_json = get_uri.get_uri_proc (url_target,user,password)
    let revx =  rev_get_proc (str_json)
    let url_delete = url_target + @"?rev=" + revx
    printfn "%s" url_delete
    get_uri.rest_delete_proc (url_delete,user,password)
  with
  | _ as ee -> printfn " %s" ee.Message

  printfn "*** 終了 ***"

  0

// ------------------------------------------------------------------
