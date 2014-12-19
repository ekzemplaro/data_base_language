// ----------------------------------------------------------------
//
//	mongo_create.boo
//
//					Nov/25/2014
//
//
// ----------------------------------------------------------------
import System
import System.Collections

import MongoDB
// ----------------------------------------------------------------
def data_prepare_proc ():
	dict_aa = {}

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1161","さいたま",74125,"1968-1-07")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1162","所沢",32187,"1968-8-12")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1163","越谷",28394,"1968-3-28")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1164","久喜",53186,"1968-2-21")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1165","熊谷",41978,"1968-1-5")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1166","秩父",75647,"1968-5-22")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1167","川越",41786,"1968-7-17")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1168","和光",54732,"1968-3-4")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1169","新座",71394,"1968-10-12")

	return	dict_aa

// ----------------------------------------------------------------
print '*** 開始 ***'

dict_aa = data_prepare_proc ()

db_name = "city_db"
col_name = "saitama"

mm = Mongo()
mm.Connect()

things = mm.GetDatabase(db_name).GetCollection (col_name)

for key in dict_aa.Keys:
	unit_aa as Hashtable = dict_aa[key]

	doc_new = Document ()
	doc_new["key"] = key
	things.Remove (doc_new)

	doc_new["name"] = unit_aa["name"]
	doc_new["population"] = unit_aa["population"]
	doc_new["date_mod"] = unit_aa["date_mod"]

	things.Save (doc_new)

mongo_manipulate.mongo_display_proc (things)

mm.Disconnect()

print '*** 終了 ***'

// ----------------------------------------------------------------
