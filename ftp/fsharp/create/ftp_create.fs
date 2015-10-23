// ------------------------------------------------------------------
//	ftp_create.fs
//
//					Mar/14/2013
//
// ------------------------------------------------------------------
open System
open System.Collections.Generic

open Newtonsoft.Json
// ------------------------------------------------------------------
let data_prepare_proc () =
  let dict_aa = new Dictionary<string,Object> ()

  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0361","盛岡",51286,"1997-6-7")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0362","久慈",95423,"1997-5-19")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0363","二戸",92831,"1997-3-28")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0364","宮古",54197,"1997-12-21")

  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0365","遠野",28976,"1997-11-25")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0366","八幡平",92345,"1997-1-26")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0367","大船渡",61384,"1997-1-21")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0368","一関",54632,"1997-3-7")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0369","花巻",39517,"1997-2-12")

  dict_aa

// ------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =

  printfn "*** 開始 ***"

  let url_in = "ftp://host_dbase/city/iwate.json"
  let user = "scott"
  let passwd = "tiger"

  let dict_aa = data_prepare_proc ()

  let str_json = JsonConvert.SerializeObject (dict_aa)

  let _ = ftp_manipulate.str_to_ftp_proc (url_in,user,passwd,str_json)

  printfn "*** 終了 ***"
  0

// ------------------------------------------------------------------
