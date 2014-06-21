// ----------------------------------------------------------------
//
//	mongo_update.fs
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
  let id_in = args.[0]
  let population_in = int args.[1]

  printfn "%s" id_in
  printfn "%d" population_in

  let db_name = "city_db"
  let col_name = "saitama"

  let mm = new Mongo()
  mm.Connect()

  let things = mm.GetDatabase(db_name).GetCollection (col_name)

  mongo_manipulate.mongo_update_proc (things,id_in,population_in)

  mongo_manipulate.mongo_display_proc (things)

  mm.Disconnect()

  printfn "*** 終了 ***"
  0

// ----------------------------------------------------------------
