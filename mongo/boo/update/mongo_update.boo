// ----------------------------------------------------------------
//
//	mongo_update.boo
//
//					Dec/23/2011
//
//
// ----------------------------------------------------------------
import System
import MongoDB
// ----------------------------------------------------------------

print "*** 開始 ***"
id_in = argv[0]
population_in = int.Parse (argv[1])

print id_in,population_in

db_name = "city_db"
col_name = "saitama"

mm = Mongo()
mm.Connect()

things = mm.GetDatabase(db_name).GetCollection (col_name)

mongo_manipulate.mongo_update_proc (things,id_in,population_in)

mongo_manipulate.mongo_display_proc (things)

mm.Disconnect()

print "*** 終了 ***"

// ----------------------------------------------------------------
