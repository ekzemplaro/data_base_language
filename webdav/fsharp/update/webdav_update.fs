// ------------------------------------------------------------------
//	webdav_update.fs
//
//					Jan/25/2012
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
  let id_in = args.[0]
  let population_in = int args.[1]

  printfn "%s" id_in
  printfn "%d" population_in

  let url = "http://host_dbase:3004/city/tokyo.json"

  let user = ""
  let password = ""

  let str_json = get_uri.get_uri_proc (url,user,password)

  let dict_bb = JsonConvert.DeserializeObject<Dictionary<string,Object>>(str_json)

  let str_json_bb = JsonConvert.SerializeObject (dict_bb)

  let dict_aa = json_manipulate.json_to_dict_proc (str_json_bb)

  let dict_aa = text_manipulate.dict_update_proc (dict_aa,id_in,population_in)

  let _ = text_manipulate.dict_display_proc (dict_aa)

  let str_json_out = JsonConvert.SerializeObject (dict_aa)

  let _ = get_uri.put_uri_string_proc (url,str_json_out,user,password)

  printfn "*** 終了 ***"

  0

// ------------------------------------------------------------------
