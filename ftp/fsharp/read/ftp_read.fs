// ------------------------------------------------------------------
//	ftp_read.fs
//
//					Mar/14/2013
//
// ------------------------------------------------------------------
open System
open System.Collections.Generic

// ------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =

  printfn "*** 開始 ***"

  let url_in = "ftp://host_dbase/city/iwate.json"
  let user = "scott"
  let passwd = "tiger"

  let str_json = ftp_manipulate.ftp_to_str_proc (url_in,user,passwd)

  let dict_aa = json_manipulate.json_to_dict_proc (str_json)

  let _ = text_manipulate.dict_display_proc (dict_aa)

  printfn "*** 終了 ***"

  0

// ------------------------------------------------------------------
