// -------------------------------------------------------------------
//
//	exist_read.fs
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

  let wc = new WebClient()
  let url = "http://cpt003:8086/exist/rest/db/cities/cities.xml"
  wc.set_Proxy (null)
  let str_xml = wc.DownloadString(url)

  let dict_aa =xml_manipulate.xml_to_dict_proc (str_xml)

  text_manipulate.dict_display_proc (dict_aa)

  printfn "*** 終了 ***"

  0
// -------------------------------------------------------------------
