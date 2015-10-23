// ----------------------------------------------------------------
//
//	read/mongo_read.boo
//
//					Dec/23/2011
//
//
// ----------------------------------------------------------------
import System
import MongoDB
// ----------------------------------------------------------------

print "*** 開始 ***"


db_name = "city_db"
col_name = "saitama"

// mm = new Mongo()
mm = Mongo()
mm.Connect()

things = mm.GetDatabase(db_name).GetCollection (col_name)

mongo_manipulate.mongo_display_proc (things)

mm.Disconnect()

print "*** 終了 ***"

// ----------------------------------------------------------------
