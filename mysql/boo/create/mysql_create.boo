// ------------------------------------------------------------
//	mysql_create.boo
//
//						Jan/30/2014
//
// ------------------------------------------------------------
import System
import System.Data
import MySql.Data.MySqlClient

// ------------------------------------------------------------
def data_prepare_proc ():
	dict_aa = {}
	dict_aa = dict_append_proc (dict_aa,'t3321','岡山',82436,'1968-3-21')
	dict_aa = dict_append_proc (dict_aa,'t3322','倉敷',52917,'1968-10-27')
	dict_aa = dict_append_proc (dict_aa,'t3323','津山',34591,'1968-5-16')
	dict_aa = dict_append_proc (dict_aa,'t3324','玉野',58492,'1968-9-23')
	dict_aa = dict_append_proc (dict_aa,'t3325','笠岡',41859,'1968-3-9')
	dict_aa = dict_append_proc (dict_aa,'t3326','井原',82963,'1968-5-19')
	dict_aa = dict_append_proc (dict_aa,'t3327','総社',51648,'1968-9-12')
	dict_aa = dict_append_proc (dict_aa,'t3328','高梁',94752,'1968-8-18')
	dict_aa = dict_append_proc (dict_aa,'t3329','新見',53164,'1968-7-11')
	return	dict_aa

// ------------------------------------------------------------
def table_insert_proc (connection,dict_aa as Hashtable):
	for key in dict_aa.Keys:
		uu_aa as Hashtable = dict_aa[key]
		name = uu_aa['name']
		population = uu_aa['population']
		date_mod = uu_aa['date_mod']
		print "${key}\t${name}\t${population}\t${date_mod}"
		mysql_insert_proc (connection,key,name,population,date_mod)
// ------------------------------------------------------------
print '*** 開始 ***'

dict_aa = data_prepare_proc ()

server="host_mysql"
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
