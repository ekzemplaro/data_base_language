// -------------------------------------------------------------------
//
//	exist_update.fs
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
  let id_in = args.[0]
  let population_in = int args.[1]
  printfn "%s\t%d" id_in population_in

  let wc = new WebClient()
  let url = "http://cpt003:8086/exist/rest/db/cities/cities.xml"
  wc.set_Proxy (null)
  let str_xml = wc.DownloadString(url)

  let dict_aa =xml_manipulate.xml_to_dict_proc (str_xml)

  let dict_aa = text_manipulate.dict_update_proc (dict_aa,id_in,population_in)
  text_manipulate.dict_display_proc (dict_aa)

  let xml_str = xml_manipulate.dict_to_xml_proc (dict_aa)

  let user = ""
  let password = ""
  get_uri.put_uri_string_proc (url,xml_str,user,password)

  printfn "*** 終了 ***"

  0
// -------------------------------------------------------------------
