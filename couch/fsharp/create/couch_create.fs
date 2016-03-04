// ------------------------------------------------------------------
//	couch_create.fs
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
let data_prepare_proc () =

  let dict_aa = new Dictionary<string,Object>()


  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2021","長野",27613,"1997-5-7")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2022","松本",36179,"1997-2-12")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2023","上田",84326,"1997-3-28")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2024","小諸",79583,"1997-2-21")

  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2025","岡谷",51978,"1997-1-5")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2026","塩尻",35647,"1997-5-22")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2027","茅野",45786,"1997-7-17")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2028","飯田",14965,"1997-3-4")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2029","中野",71324,"1997-10-12")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2030","諏訪",32845,"1997-6-9")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2031","駒ヶ根",81576,"1997-5-7")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2032","佐久",58124,"1997-2-12")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2033","伊那",34897,"1997-8-21")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2034","千曲",21746,"1997-1-25")

  dict_aa

// -------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =

  printfn "*** 開始 ***"


  let url_collection = "http://localhost:5984/nagano"

  let user = ""
  let password = ""

  let _ = get_uri.rest_delete_proc (url_collection,user,password)
  let _ = get_uri.put_uri_string_proc (url_collection,"",user,password)

  let dict_aa = data_prepare_proc ()

  printfn "%d" dict_aa.Count

  for unit in dict_aa do
//    Console.WriteLine (unit.Key)
    let str_json_out = JsonConvert.SerializeObject (unit.Value)
//    printfn "%s" str_json_out
    let url = url_collection + "/" + unit.Key
//    printfn "%s" url
    get_uri.put_uri_string_proc (url,str_json_out,user,password)
  done


  printfn "*** 終了 ***"

  0

// ------------------------------------------------------------------
