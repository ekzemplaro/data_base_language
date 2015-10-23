// -------------------------------------------------------------------
//
//	json_create.fs
//
//					Aug/22/2013
//
// -------------------------------------------------------------------
open System
open System.Text
open Microsoft.FSharp.Core
open System.IO
open System.Collections
open System.Collections.Generic

open Newtonsoft.Json
// -------------------------------------------------------------------
let data_prepare_proc () =

  let dict_aa = new Dictionary<string,Object>()


  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0921","宇都宮",25613,"1997-10-7")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0922","小山",36879,"1997-5-12")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0923","佐野",84926,"1997-9-28")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0924","足利",29513,"1997-2-21")

  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0925","日光",81974,"1997-1-5")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0926","下野",75642,"1997-5-22")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0927","さくら",49786,"1997-7-17")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0928","矢板",54136,"1997-3-4")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0929","真岡",71324,"1997-10-12")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0930","栃木",32845,"1997-6-9")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0931","大田原",84576,"1997-5-7")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0932","鹿沼",58124,"1997-2-12")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0933","那須塩原",34597,"1997-8-21")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0934","那須烏山",21846,"1997-1-25")

  dict_aa;

// -------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =

  printfn "*** 開始 ***"

  let file_out = args.[0]

  printfn "\tfile_out = %s"  file_out

  let dict_aa = data_prepare_proc ()

  let _ = text_manipulate.dict_display_proc (dict_aa)

  let str_json = JsonConvert.SerializeObject (dict_aa)

  let _ = file_io.file_write_proc (file_out,str_json)

  printfn "*** 終了 ***"

  0
// --------------------------------------------------------------------
