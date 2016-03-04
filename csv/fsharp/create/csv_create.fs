// -------------------------------------------------------------------
//
//	csv_create.fs
//
//					Feb/08/2016
//
// -------------------------------------------------------------------
open System
open System.IO
open System.Text
open Microsoft.FSharp.Core
open System.Collections.Generic
// -------------------------------------------------------------------
let data_prepare_proc () =

  let dict_aa = new Dictionary<string,Object>()


  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1271","千葉",75623,"1997-1-07")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1272","勝浦",36879,"1997-2-12")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1273","市原",84126,"1997-3-28")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1274","流山",29513,"1997-2-21")

  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1275","八千代",31978,"1997-1-5")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1276","我孫子",75647,"1997-5-22")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1277","鴨川",46781,"1997-7-17")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1278","銚子",24735,"1997-3-4")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1279","市川",71324,"1997-10-12")

  dict_aa

// --------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =

  printfn "*** 開始 ***"

  let file_out = args.[0]

  printfn "\tfile_out = %s" file_out

  let dict_aa = data_prepare_proc ()

  let _ = text_manipulate.csv_write_proc (file_out,dict_aa)

  printfn "*** 終了 ***"
  0

// --------------------------------------------------------------------
