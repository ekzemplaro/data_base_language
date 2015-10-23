// ------------------------------------------------------------------
//	webdav_create.fs
//
//					Jan/25/2012
//
// ------------------------------------------------------------------
open System
open System.Collections.Generic

open Newtonsoft.Json
// ------------------------------------------------------------------
let data_prepare_proc () =
  let dict_aa = new Dictionary<string,Object> ()

  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1351","八王子",51286,"1997-6-7")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1352","立川",95423,"1997-5-19")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1353","武蔵野",92831,"1997-3-28")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1354","三鷹",54197,"1997-12-21")

  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1355","青梅",28976,"1997-11-25")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1356","府中",92345,"1997-1-26")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1357","昭島",61384,"1997-1-21")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1358","調布",54632,"1997-3-7")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1359","町田",39517,"1997-2-12")

  dict_aa

// ------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =

  printfn "*** 開始 ***"

  let url_in = "http://host_dbase:3004/city/tokyo.json"
  let user = ""
  let passwd = ""

  let dict_aa = data_prepare_proc ()

  let str_json = JsonConvert.SerializeObject (dict_aa)

  let _ = get_uri.put_uri_string_proc (url_in,str_json,user,passwd)

  printfn "*** 終了 ***"
  0

// ------------------------------------------------------------------
