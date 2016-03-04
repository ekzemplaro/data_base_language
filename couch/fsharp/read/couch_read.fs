// -------------------------------------------------------------------
//
//	couch_read.fs
//
//					Mar/03/2016
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
let list_parser (list_pp: List<Dictionary<String,Object>>) =
  for unit in list_pp do
  let key = unit.Item ("key")
  let doc = unit.Item ("doc")
  let str_json_out = JsonConvert.SerializeObject (doc)
  let dict_cc = JsonConvert.DeserializeObject<Dictionary<String,Object>> (str_json_out)
  let name = dict_cc.Item ("name")
  let population = dict_cc.Item ("population")
  let date_mod = dict_cc.Item ("date_mod")
  Console.Write (key.ToString () + "\t")
  Console.Write (name.ToString () + "\t")
  Console.Write (population.ToString () + "\t")
  Console.Write (date_mod.ToString () + "\n")
  done
// -------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =

  printfn "*** 開始 ***"

  let url = "http://localhost:5984/nagano"

  let user = ""
  let password = ""

  let url_all_docs = url + "/_all_docs?include_docs=true"
  let str_json = get_uri.get_uri_proc (url_all_docs,user,password)

  let all_docs = JsonConvert.DeserializeObject<Dictionary<string,Object>>(str_json)

//  Console.WriteLine (all_docs.["total_rows"].ToString ())
  let bbb_json = all_docs.["rows"].ToString ()
  let list_pp = JsonConvert.DeserializeObject<List<Dictionary<String,Object>>> (bbb_json)
//  Console.WriteLine (list_pp.Count)

  let _ = list_parser (list_pp)

  printfn "*** 終了 ***"

  0

// ------------------------------------------------------------------
