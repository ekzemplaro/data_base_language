// ------------------------------------------------------------
//	mssql_create.boo
//
//						Jan/17/2013
//
// ------------------------------------------------------------
import System

// ------------------------------------------------------------
def data_prepare_proc ():
	dict_aa = {}
	dict_aa = dict_append_proc (dict_aa,'t1071','前橋',43695,'1968-4-21')
	dict_aa = dict_append_proc (dict_aa,'t1072','高崎',12657,'1968-10-27')
	dict_aa = dict_append_proc (dict_aa,'t1073','桐生',84593,'1968-5-16')
	dict_aa = dict_append_proc (dict_aa,'t1074','沼田',17492,'1968-9-23')
	dict_aa = dict_append_proc (dict_aa,'t1075','伊勢崎',49851,'1968-3-9')
	dict_aa = dict_append_proc (dict_aa,'t1076','水上',82163,'1968-5-19')
	dict_aa = dict_append_proc (dict_aa,'t1077','太田',51648,'1968-9-12')
	dict_aa = dict_append_proc (dict_aa,'t1078','安中',94192,'1968-8-18')
	dict_aa = dict_append_proc (dict_aa,'t1079','みどり',57814,'1968-7-11')
	return	dict_aa

// ------------------------------------------------------------
def table_insert_proc (str_connect,dict_aa as Hashtable):
	for key in dict_aa.Keys:
		uu_aa as Hashtable = dict_aa[key]
		name = uu_aa['name']
		population = uu_aa['population']
		date_mod = uu_aa['date_mod']
		print "${key}\t${name}\t${population}\t${date_mod}"
		mssql_manipulate.mssql_insert_proc (str_connect,key,name,population,date_mod)
// ------------------------------------------------------------
print '*** 開始 ***'

dict_aa = data_prepare_proc ()

str_connect = "server=host_mssql;" + "uid=sa;" + "pwd=scott_tiger;" + "database=city;"


mssql_manipulate.table_drop_proc (str_connect)
mssql_manipulate.table_create_proc (str_connect)

table_insert_proc (str_connect,dict_aa)

print '*** 終了 ***'
// ------------------------------------------------------------
