// ----------------------------------------------------------------
//
//	mongo_delete.boo
//
//					Nov/25/2014
//
//
// ----------------------------------------------------------------
import System
import MongoDB
// ----------------------------------------------------------------
print "*** 開始 ***"
key_in = argv[0]

print key_in

db_name = "city_db"
col_name = "saitama"

mm = Mongo()
mm.Connect()

things = mm.GetDatabase(db_name).GetCollection (col_name)

doc_del = Document ()
doc_del["key"] = key_in

things.Remove (doc_del)

mongo_manipulate.mongo_display_proc (things)

mm.Disconnect()

print "*** 終了 ***"

// ----------------------------------------------------------------
