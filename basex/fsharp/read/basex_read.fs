// ------------------------------------------------------------------
//	basex_read.fs
//
//					Feb/02/2011
//
// ------------------------------------------------------------------
open System
open System.Collections.Generic
// ------------------------------------------------------------------
// ------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =

  printfn "*** 開始 ***"

  let url = "http://localhost:8984/rest/cities?query=/"

  printfn "%s" url

  let user = "admin"
  let password = "admin"

  let str_xml = get_uri.get_uri_proc (url,user,password)

  let dict_aa = xml_manipulate.xml_to_dict_proc (str_xml)

  text_manipulate.dict_display_proc (dict_aa)

  printfn "*** 終了 ***"

  0

// ------------------------------------------------------------------
