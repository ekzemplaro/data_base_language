// -------------------------------------------------------------------
//
//	text_create.fs
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

  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2381","名古屋",75623,"1997-1-07")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2382","豊橋",36179,"1997-2-12")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2383","岡崎",84926,"1997-3-28")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2384","一宮",29513,"1997-2-21")

  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2385","蒲郡",51978,"1997-1-5")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2386","常滑",35647,"1997-5-22")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2387","大府",42786,"1997-7-17")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2388","瀬戸",24835,"1997-3-4")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2389","犬山",71324,"1997-10-12")

  dict_aa

// --------------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =

  printfn "*** 開始 ***"

  let file_out = args.[0]

  printfn "\tfile_out = %s" file_out

  let dict_aa = data_prepare_proc ();

  let _ = text_manipulate.text_write_proc (file_out,dict_aa);

  printfn "*** 終了 ***"
  0

// --------------------------------------------------------------------
