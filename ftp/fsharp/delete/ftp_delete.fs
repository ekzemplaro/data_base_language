// ------------------------------------------------------------------
//	ftp_delete.fs
//
//					Mar/14/2013
//
// ------------------------------------------------------------------
open System
open System.Collections.Generic

open Newtonsoft.Json
// ------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =

  printfn "*** 開始 ***"
  let key = args.[0]
  printfn "%s" key

  let url_ftp = "ftp://host_dbase/city/iwate.json"
  let user = "scott"
  let passwd = "tiger"

  let str_json = ftp_manipulate.ftp_to_str_proc (url_ftp,user,passwd)

  let dict_aa = json_manipulate.json_to_dict_proc (str_json)

  let _ = dict_aa.Remove (key)

  let _ = text_manipulate.dict_display_proc (dict_aa)

  let str_json_out = JsonConvert.SerializeObject (dict_aa)

  let _ = ftp_manipulate.str_to_ftp_proc (url_ftp,user,passwd,str_json_out)

  printfn  "*** 終了 ***"
  0

// ------------------------------------------------------------------
