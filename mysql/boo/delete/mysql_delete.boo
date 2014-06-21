// ------------------------------------------------------------
//	mysql_delete.boo
//
//						Jan/30/2014
//
// ------------------------------------------------------------
import System
import System.Data
import MySql.Data.MySqlClient

print '*** 開始 ***'
id_in = argv[0]

print id_in

server="host_mysql"
str_db="city"

str_connect = "Server=" + server + ";User Id=scott;Password=tiger;" + "Database=" + str_db + ";"

connection = MySqlConnection (str_connect)
connection.Open ()

mysql_delete_proc (connection,id_in)
connection.Close ()


print '*** 終了 ***'
// ------------------------------------------------------------
