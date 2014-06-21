// ----------------------------------------------------------------
//
//	firebird_create.boo
//
//					Nov/14/2011
//
//
// ----------------------------------------------------------------
import System

import FirebirdSql.Data.FirebirdClient

// ----------------------------------------------------------------
def data_prepare_proc ():

	dict_aa = {}

	dict_aa = dict_append_proc (dict_aa,'t3821','松山',84592,'1925-5-17')
	dict_aa = dict_append_proc (dict_aa,'t3822','今治',87251,'1925-2-2')
	dict_aa = dict_append_proc (dict_aa,'t3823','宇和島',84926,'1925-3-28')
	dict_aa = dict_append_proc (dict_aa,'t3824','八幡浜',29513,'1925-2-21')

	dict_aa = dict_append_proc (dict_aa,'t3825','新居浜',51978,'1925-1-5')
	dict_aa = dict_append_proc (dict_aa,'t3826','西条',75647,'1925-5-22')
	dict_aa = dict_append_proc (dict_aa,'t3827','大洲',46786,'1925-7-17')
	dict_aa = dict_append_proc (dict_aa,'t3828','伊予',24835,'1925-3-4')
	dict_aa = dict_append_proc (dict_aa,'t3829','西予',71324,'1925-10-12')

	return dict_aa
// ----------------------------------------------------------------
def table_insert_proc (conn,dict_aa as Hashtable):
	for key in dict_aa.Keys:
		uu_aa as Hashtable = dict_aa[key]
		name = uu_aa['name']
		population = uu_aa['population']
		date_mod = uu_aa['date_mod']
		fbd_manipulate.sql_insert_proc (conn,key,name,population,date_mod)
// ----------------------------------------------------------------
print "*** 開始 ***"

user = "sysdba"
passwd = "tiger"
dbname = "/var/tmp/firebird/cities.fdb"

str_connect = "User ID=" + user + ";Password=" + passwd + ";Database=" + dbname + ";DataSource=localhost;Charset=NONE;"

conn = FbConnection (str_connect)
conn.Open()

dict_aa = data_prepare_proc ()


fbd_manipulate.table_drop_proc (conn)

fbd_manipulate.table_create_proc (conn)

table_insert_proc (conn,dict_aa)

fbd_manipulate.firebird_display_proc (conn)

conn.Close() 

print "*** 終了 ***"

// ----------------------------------------------------------------
