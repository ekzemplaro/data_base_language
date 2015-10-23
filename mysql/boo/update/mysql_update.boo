// ------------------------------------------------------------
//	mysql_update.boo
//
//						Jan/30/2014
//
// ------------------------------------------------------------
import System
import System.Data
import MySql.Data.MySqlClient

// ------------------------------------------------------------
print '*** 開始 ***'
key_in = argv[0]
population_in = int.Parse (argv[1])

print key_in,population_in

server="host_mysql"
str_db="city"

str_connect = "Server=" + server + ";User Id=scott;Password=tiger;" + "Database=" + str_db + ";"


connection = MySqlConnection (str_connect)
connection.Open ()

today = DateTime.Now.ToString ()
print today
mysql_update_proc (connection,key_in,population_in)
connection.Close ()

print '*** 終了 ***'
// ------------------------------------------------------------
