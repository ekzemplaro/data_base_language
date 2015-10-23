// ----------------------------------------------------------------
//
//	read/mongo_read.fs
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


  let db_name = "city_db"
  let col_name = "saitama"

  let mm = new Mongo()
  mm.Connect ()

  let things = mm.GetDatabase(db_name).GetCollection (col_name)

  mongo_manipulate.mongo_display_proc (things)

  mm.Disconnect ()

  printfn "*** 終了 ***"
  0

// ----------------------------------------------------------------
