// ------------------------------------------------------------
//	mssql_update.boo
//
//					Jan/17/2013
//
// ------------------------------------------------------------
import System
import System.Data.SqlClient

print '*** 開始 ***'
id_in = argv[0]
population_in = int.Parse (argv[1])

print id_in,population_in

str_connect = "server=host_mssql;" + "uid=sa;" + "pwd=scott_tiger;" + "database=city;"

connection = SqlConnection (str_connect)
connection.Open ()

today = DateTime.Now.ToString ()
mssql_manipulate.mssql_update_proc (connection,id_in,population_in,today)

dtable = table_manipulate.table_prepare_proc ()
mssql_manipulate.mssql_data_fetch_proc (connection,dtable)
connection.Close ()
table_manipulate.display_proc (dtable)

print '*** 終了 ***'
// ------------------------------------------------------------
