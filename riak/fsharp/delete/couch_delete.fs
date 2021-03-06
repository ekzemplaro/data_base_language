// ------------------------------------------------------------------
//	couch_delete.fs
//
//					Mar/14/2013
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
[<EntryPoint>]
let main (args : string[] ) =

  printfn "*** 開始 ***"
  let key = args.[0]

  printfn "%s" key

  let url = "http://host_dbase:5984/city/cities"

  let user = ""
  let password = ""

  let str_json = get_uri.get_uri_proc (url,user,password)

  let dict_bb = JsonConvert.DeserializeObject<Dictionary<string,Object>>(str_json)

  let idx = dict_bb.["_id"]
  let revx = dict_bb.["_rev"]

  let _ = dict_bb.Remove ("_id")
  let _ = dict_bb.Remove ("_rev")

  let str_json_bb = JsonConvert.SerializeObject (dict_bb)

  let dict_aa = json_manipulate.json_to_dict_proc (str_json_bb)

  let _ = dict_aa.Remove (key)

  let _ = text_manipulate.dict_display_proc (dict_aa)

  let _ = dict_aa.Add ("_id",idx)
  let _ = dict_aa.Add ("_rev",revx)

  let str_json_out = JsonConvert.SerializeObject (dict_aa)

  let _ = get_uri.put_uri_string_proc (url,str_json_out,user,password)

  printfn "*** 終了 ***"

  0

// ------------------------------------------------------------------
