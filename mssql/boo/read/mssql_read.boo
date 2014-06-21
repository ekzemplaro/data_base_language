// ------------------------------------------------------------
//	mssql_read.boo
//
//						Jan/17/2013
//
// ------------------------------------------------------------
import System
import System.Data
import System.Data.SqlClient

print '*** 開始 ***'

str_connect = "server=host_mssql;" + "uid=sa;" + "pwd=scott_tiger;" + "database=city;"
 
command = "select ID,Name,Population,date_mod from cities"

da_adapter = SqlDataAdapter (command,str_connect)

dtable = DataTable ()

da_adapter.Fill (dtable)

table_manipulate.display_proc (dtable)

print '*** 終了 ***'
// ------------------------------------------------------------
