// ------------------------------------------------------------
//	mysql_read.boo
//
//						Jan/30/2014
//
// ------------------------------------------------------------
import System
import System.Data
import MySql.Data.MySqlClient

// ------------------------------------------------------------
print '*** 開始 ***'

server="host_mysql"
str_db="city"

str_connect = "Server=" + server + ";User Id=scott;Password=tiger;" + "Database=" + str_db + ";"

str_com = "select * from cities"

da_adapter = MySqlDataAdapter (str_com,str_connect)

dtable = DataTable ()

da_adapter.Fill (dtable)

table_display_proc (dtable)

print '*** 終了 ***'
// ------------------------------------------------------------
