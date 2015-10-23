// ------------------------------------------------------------------
//	couch_create.fs
//
//					Aug/22/2013
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
let data_prepare_proc () =

  let dict_aa = new Dictionary<string,Object>()


  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2021","長野",25613,"1997-5-7")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2022","松本",36879,"1997-2-12")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2023","上田",84926,"1997-3-28")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2024","小諸",29513,"1997-2-21")

  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2025","岡谷",51978,"1997-1-5")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2026","塩尻",35647,"1997-5-22")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2027","茅野",45786,"1997-7-17")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2028","飯田",14935,"1997-3-4")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2029","中野",71324,"1997-10-12")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2030","諏訪",32845,"1997-6-9")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2031","駒ヶ根",84576,"1997-5-7")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2032","佐久",58124,"1997-2-12")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2033","伊那",34597,"1997-8-21")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2034","千曲",21846,"1997-1-25")

  dict_aa

// -------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =

  printfn "*** 開始 ***"

  let dict_aa = data_prepare_proc ()

  let url = "http://host_dbase:5984/city/cities"

  let user = ""
  let password = ""

  let str_json = get_uri.get_uri_proc (url,user,password)

  let dict_bb = JsonConvert.DeserializeObject<Dictionary<string,Object>>(str_json)

  let idx = dict_bb.["_id"]
  let revx = dict_bb.["_rev"]

  let _ = text_manipulate.dict_display_proc (dict_aa)

  let _ = dict_aa.Add ("_id",idx)
  let _ = dict_aa.Add ("_rev",revx)

  let str_json_out = JsonConvert.SerializeObject (dict_aa)

  let _ = get_uri.put_uri_string_proc (url,str_json_out,user,password)

  printfn "*** 終了 ***"

  0

// ------------------------------------------------------------------
