// ------------------------------------------------------------
//	sqlite3_create.boo
//
//						Sep/27/2011
//
// ------------------------------------------------------------
import System
import Mono.Data.Sqlite

// ------------------------------------------------------------
def data_prepare_proc ():
	dict_aa = {}
	dict_aa = dict_append_proc (dict_aa,'t0711','郡山','82436','1968-4-21')
	dict_aa = dict_append_proc (dict_aa,'t0712','会津若松','52657','1968-10-27')
	dict_aa = dict_append_proc (dict_aa,'t0713','白河','34593','1968-5-16')
	dict_aa = dict_append_proc (dict_aa,'t0714','福島','52492','1968-9-23')
	dict_aa = dict_append_proc (dict_aa,'t0715','喜多方','41851','1968-3-9')
	dict_aa = dict_append_proc (dict_aa,'t0716','二本松','82763','1968-5-19')
	dict_aa = dict_append_proc (dict_aa,'t0717','いわき','51748','1968-9-12')
	dict_aa = dict_append_proc (dict_aa,'t0718','相馬','94792','1968-8-18')
	dict_aa = dict_append_proc (dict_aa,'t0719','須賀川','57564','1968-7-11')
	return	dict_aa
// ------------------------------------------------------------
def drop_table_proc (dbcon):
	dbcmd as SqliteCommand = SqliteCommand()
	dbcmd.Connection = dbcon

	dbcmd.CommandText = "drop table cities"
	dbcmd.ExecuteNonQuery()

	dbcmd.Dispose()
// ------------------------------------------------------------
def create_table_proc (dbcon):
	dbcmd as SqliteCommand = SqliteCommand()
	dbcmd.Connection = dbcon

	dbcmd.CommandText = "create TABLE cities (id varchar(10) NOT NULL PRIMARY KEY,name text,population int,date_mod text)"
	dbcmd.ExecuteNonQuery()

	dbcmd.Dispose()
// ------------------------------------------------------------
def insert_proc_exec (dbcon,id_in,name_in,population_in,date_mod_in):
	dbcmd as SqliteCommand = SqliteCommand()
	dbcmd.Connection = dbcon

	sql = "insert into cities (id, Name, Population, date_mod) values ('"
	sql += id_in + "','" + name_in + "'," + population_in
	sql += ",'" + date_mod_in + "')"
	dbcmd.CommandText = sql
	dbcmd.ExecuteNonQuery()

	dbcmd.Dispose()

// ------------------------------------------------------------
def table_insert_proc (dbcon,dict_aa as Hashtable):
	for key in dict_aa.Keys:
		uu_aa as Hashtable = dict_aa[key]
		name = uu_aa['name']
		population = uu_aa['population']
		date_mod = uu_aa['date_mod']
		print "${key}\t${name}\t${population}\t${date_mod}"
		insert_proc_exec (dbcon,key,name,population,date_mod)

// ------------------------------------------------------------
print '*** 開始 ***'
file_sqlite3 = argv[0]
print file_sqlite3

dict_aa = data_prepare_proc ()


dbcon as SqliteConnection = SqliteConnection()

connectionString as string = 'URI=file:' + file_sqlite3

dbcon.ConnectionString = connectionString
//
dbcon.Open()

drop_table_proc (dbcon)
create_table_proc (dbcon)

table_insert_proc (dbcon,dict_aa)

dbcon.Close()

print '*** 終了 ***'
// ------------------------------------------------------------
