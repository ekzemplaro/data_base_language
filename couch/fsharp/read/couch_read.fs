// -------------------------------------------------------------------
//
//	couch_read.fs
//
//					Mar/13/2013
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

//  let url = "http://host_dbase:5984/city/cities"
  let url = "http://cddn007:5984/city/cities"

  let user = ""
  let password = ""

  let str_json = get_uri.get_uri_proc (url,user,password)

  let dict_bb = JsonConvert.DeserializeObject<Dictionary<string,Object>>(str_json)

//  printfn "%s" dict_bb["_id"]
//  printfn "%s" dict_bb.("_rev")

  let _ = dict_bb.Remove ("_id")
  let _ = dict_bb.Remove ("_rev")

  let str_json_bb = JsonConvert.SerializeObject (dict_bb)

  let dict_aa = json_manipulate.json_to_dict_proc (str_json_bb)

  let _ = text_manipulate.dict_display_proc (dict_aa)

  printfn "*** 終了 ***"

  0

// ------------------------------------------------------------------
