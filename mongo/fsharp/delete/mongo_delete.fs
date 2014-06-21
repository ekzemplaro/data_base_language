// ----------------------------------------------------------------
//
//	mongo_delete.fs
//
//					Dec/23/2011
//
//
// ----------------------------------------------------------------
open System
open MongoDB
// ----------------------------------------------------------------
[<EntryPoint>]
let main (args : string[] ) =

  printfn "*** 開始 ***"
  let key_in = args.[0]

  printfn "%s" key_in

  let db_name = "city_db"
  let col_name = "saitama"

  let mm = new Mongo()
  mm.Connect()

  let things = mm.GetDatabase(db_name).GetCollection (col_name)

  let doc_del = new Document ()
  let doc_del["key"] = key_in

  things.Remove (doc_del)

  mongo_manipulate.mongo_display_proc (things)

  mm.Disconnect()

  printfn "*** 終了 ***"
  0

// ----------------------------------------------------------------
