// ------------------------------------------------------------
//	postgre_create.boo
//
//						Nov/21/2014
//
// ------------------------------------------------------------
import System
import System.Collections
import Npgsql
// ------------------------------------------------------------
def data_prepare_proc ():
	dict_aa = {}
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3461','広島',38924,'1968-4-21')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3462','福山',65731,'1968-10-27')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3463','東広島',34593,'1968-5-16')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3464','呉',52492,'1968-9-23')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3465','尾道',41851,'1968-3-9')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3466','竹原',82963,'1968-5-19')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3467','三次',51648,'1968-9-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3468','大竹',94792,'1968-8-18')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t3469','府中',61362,'1968-7-11')
	return	dict_aa

// ------------------------------------------------------------
def table_insert_proc (connection,dict_aa as Hashtable):
	for key in dict_aa.Keys:
		uu_aa as Hashtable = dict_aa[key]
		name = uu_aa['name']
		population = uu_aa['population']
		date_mod = uu_aa['date_mod']
		print "${key}\t${name}\t${population}\t${date_mod}"
		postgre_insert_proc (connection,key,name,population,date_mod)
// ------------------------------------------------------------
print '*** 開始 ***'

dict_aa = data_prepare_proc ()

server="localhost"
port="5432"
str_db="city"

str_connect = "Server=" + server + ";Port=" + port + ";User Id=scott;Password=tiger;" + "ENCODING=UNICODE;Database=" + str_db + ";"

connection = NpgsqlConnection (str_connect)
connection.Open ()

postgre_table_drop_proc (connection)
postgre_table_create_proc (connection)

table_insert_proc (connection,dict_aa)

connection.Close ()
print '*** 終了 ***'
// ------------------------------------------------------------
