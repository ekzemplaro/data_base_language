// ----------------------------------------------------------------
//
//	mongo_create.fs
//
//					Dec/23/2011
//
//
// ----------------------------------------------------------------
open System
open System.Collections.Generic

open MongoDB
// ----------------------------------------------------------------
let data_prepare_proc () =
  let dict_aa = new Dictionary<string,Object> ()
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1161","さいたま",74125,"2009-1-07")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1162","所沢",32617,"2009-2-12")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1163","越谷",21395,"2009-3-28")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1164","久喜",53167,"2009-2-21")

  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1165","熊谷",81974,"2009-1-5")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1166","秩父",75637,"2009-5-22")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1167","川越",46781,"2009-7-17")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1168","和光",54237,"2009-3-4")
  let dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1169","新座",71394,"2009-10-12")
  dict_aa

// ----------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =

  printfn "*** 開始 ***"

  let dict_aa = data_prepare_proc ()

  let db_name = "city_db"
  let col_name = "saitama"

  let mm = new Mongo()
  mm.Connect()

  let things = mm.GetDatabase(db_name).GetCollection (col_name)

  for kv in dict_aa do
    let unit_aa = kv.Value

    let doc_new = new Document ()
    let doc_new["key"] = kv.Key
    things.Remove (doc_new)

    let doc_new["name"] = unit_aa["name"]
    let doc_new["population"] = unit_aa["population"]
    let doc_new["date_mod"] = unit_aa["date_mod"]

    things.Save (doc_new)
  done

  mongo_manipulate.mongo_display_proc (things)

  mm.Disconnect()

  printfn "*** 終了 ***"
  0

// ----------------------------------------------------------------
