// -------------------------------------------------------------------
//
//	exist_create.fs
//
//					Sep/18/2011
//
// -------------------------------------------------------------------

open System
open System.Net
open System.Collections.Generic

// -------------------------------------------------------------------
let data_prepare_proc () =

  let dict_aa = new Dictionary<string,Object>()


  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4251","長崎",25623,"1997-1-07")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4252","佐世保",36879,"1997-2-12")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4253","島原",84926,"1997-3-28")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4254","大村",29513,"1997-2-21")

  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4255","諫早",81978,"1997-1-5")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4256","五島",75647,"1997-5-22")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4257","平戸",46786,"1997-7-17")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4258","雲仙",54535,"1997-3-4")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4259","松浦",71324,"1997-10-12")

  dict_aa
// -------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =

  printfn "*** 開始 ***"

  let dict_aa = data_prepare_proc ()

  text_manipulate.dict_display_proc (dict_aa)

  let xml_str = xml_manipulate.dict_to_xml_proc (dict_aa)

  let url = "http://cpt003:8086/exist/rest/db/cities/cities.xml"
  let user = ""
  let password = ""
  get_uri.put_uri_string_proc (url,xml_str,user,password)

  printfn "*** 終了 ***"

  0
// -------------------------------------------------------------------
