// ------------------------------------------------------------
//	postgre_read.boo
//
//						Sep/28/2011
//
// ------------------------------------------------------------
import System
import System.Data
import Npgsql

print '*** 開始 ***'

server="localhost"
port="5432"
str_db="city"

str_connect = "Server=" + server + ";Port=" + port + ";User Id=scott;Password=tiger;" + "ENCODING=UNICODE;Database=" + str_db + ";"

str_com = "select * from cities"

da_adapter = NpgsqlDataAdapter (str_com,str_connect)

dtable = DataTable ()

da_adapter.Fill (dtable)

table_manipulate.display_proc (dtable)

print '*** 終了 ***'
// ------------------------------------------------------------
