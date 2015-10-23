// ------------------------------------------------------------
//	postgre_delete.boo
//
//						Sep/28/2011
//
// ------------------------------------------------------------
import System

print '*** 開始 ***'
id_in = argv[0]

print id_in

server="localhost"
port="5432"
str_db="city"

str_connect = "Server=" + server + ";Port=" + port + ";User Id=scott;Password=tiger;" + "ENCODING=UNICODE;Database=" + str_db + ";"

postgre_manipulate.data_delete_proc (str_connect,id_in)

dtable = table_manipulate.table_prepare_proc ()

postgre_manipulate.data_fetch_proc (str_connect,dtable)


postgre_manipulate.data_update_proc (str_connect,dtable)

table_manipulate.display_proc (dtable)

print '*** 終了 ***'
// ------------------------------------------------------------
