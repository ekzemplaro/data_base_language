// -------------------------------------------------------------------
//
//	exist_delete.fs
//
//					Sep/18/2011
//
// -------------------------------------------------------------------

open System
open System.Net
open System.Collections.Generic

// -------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =

  printfn "*** 開始 ***"
  let key = args.[0]
  printfn "%s" key

  let wc = new WebClient()
  let url = "http://cpt003:8086/exist/rest/db/cities/cities.xml"
  wc.set_Proxy (null)
  let str_xml = wc.DownloadString(url)

  let dict_aa =xml_manipulate.xml_to_dict_proc (str_xml)

  let _ = dict_aa.Remove (key)

  text_manipulate.dict_display_proc (dict_aa)

  let xml_str = xml_manipulate.dict_to_xml_proc (dict_aa)

  let user = ""
  let password = ""
  get_uri.put_uri_string_proc (url,xml_str,user,password)

  printfn "*** 終了 ***"

  0
// -------------------------------------------------------------------
