// -------------------------------------------------------------------
//
//	xindice_create.fs
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

  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0271","青森",62381,"1997-1-07")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0272","弘前",36879,"1997-2-12")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0273","八戸",84926,"1997-3-28")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0274","三沢",29513,"1997-2-21")

  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0275","黒石",81978,"1997-1-5")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0276","むつ",75647,"1997-5-22")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0277","五所川原",46786,"1997-7-17")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0278","十和田",54535,"1997-3-4")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0279","平川",71396,"1997-10-12")

  dict_aa
// -------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =

  printfn "*** 開始 ***"

  let dict_aa = data_prepare_proc ()

  text_manipulate.dict_display_proc (dict_aa)

  let xml_str = xml_manipulate.dict_to_xml_proc (dict_aa)

  let url = "http://host_xindice:8888/xindice/db/cities/cities"

  let user = ""
  let password = ""
  get_uri.put_uri_string_proc (url,xml_str,user,password)

  printfn "*** 終了 ***"

  0
// -------------------------------------------------------------------
