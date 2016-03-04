// ------------------------------------------------------------------
//	couch_update.fs
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
let update_proc (url_base: string,key_in: string,population_in: int) =
  let url_target = url_base + "/" + key_in
  let user = ""
  let password = ""

  let str_json = get_uri.get_uri_proc (url_target,user,password)

  printfn "%s" str_json

  let unit_aa = JsonConvert.DeserializeObject<Dictionary<string,Object>>(str_json)

  let idx = unit_aa.["_id"].ToString ()
  let revx = unit_aa.["_rev"].ToString ()
  let name = unit_aa.["name"].ToString ()
  let population = unit_aa.["population"].ToString ()
  let date_mod = unit_aa.["date_mod"].ToString ()

  printfn "%s" idx
  printfn "%s" revx
  printfn "%s" name
  printfn "%s" population
  printfn "%s" date_mod

  let today = System.String.Format ("{0:yyyy-MM-dd}",System.DateTime.Now)

  let unit_bb = dict["_rev",revx;"name",name;"population",population_in.ToString ();"date_mod",today]
  let str_unit_bb = JsonConvert.SerializeObject (unit_bb)
  Console.WriteLine (str_unit_bb)
  let _ = get_uri.put_uri_string_proc (url_target,str_unit_bb,user,password)
  ()
// -------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =

  printfn "*** 開始 ***"
  let key_in = args.[0]
  let population_in = int args.[1]

  printfn "%s" key_in
  printfn "%d" population_in

  let url_base = "http://localhost:5984/nagano"

  try
    update_proc (url_base,key_in,population_in)
  with
  | _ as ee -> printfn " %s" ee.Message

  printfn "*** 終了 ***"

  0

// ------------------------------------------------------------------
