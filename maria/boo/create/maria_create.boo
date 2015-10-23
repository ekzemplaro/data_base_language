// ------------------------------------------------------------
//	maria_create.boo
//
//						Nov/19/2014
//
// ------------------------------------------------------------
import System
import System.Data
import MySql.Data.MySqlClient

// ------------------------------------------------------------
def data_prepare_proc ():
	dict_aa = {}
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3321','岡山',851436,'1968-5-24')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3322','倉敷',568917,'1968-11-17')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3323','津山',372591,'1968-8-18')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3324','玉野',518492,'1968-2-23')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3325','笠岡',431759,'1968-3-9')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3326','井原',827963,'1968-5-19')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3327','総社',512648,'1968-9-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3328','高梁',948752,'1968-8-18')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3329','新見',835164,'1968-7-11')
	return	dict_aa

// ------------------------------------------------------------
def table_insert_proc (connection,dict_aa as System.Collections.Hashtable):
	for key in dict_aa.Keys:
		uu_aa as System.Collections.Hashtable = dict_aa[key]
		name = uu_aa['name']
		population = uu_aa['population']
		date_mod = uu_aa['date_mod']
		print "${key}\t${name}\t${population}\t${date_mod}"
		mysql_insert_proc (connection,key,name,population,date_mod)
// ------------------------------------------------------------
print '*** 開始 ***'

dict_aa = data_prepare_proc ()

server="localhost"
str_db="city"

str_connect = "Server=" + server + ";User Id=scott;Password=tiger;" + "Database=" + str_db + ";"

connection = MySqlConnection (str_connect)
connection.Open ()


mysql_table_drop_proc (connection)
mysql_table_create_proc (connection)

table_insert_proc (connection,dict_aa)

connection.Close ()

print '*** 終了 ***'
// ------------------------------------------------------------
