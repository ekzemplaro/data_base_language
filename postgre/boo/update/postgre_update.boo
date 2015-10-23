// ------------------------------------------------------------
//	postgre_update.boo
//
//						Sep/28/2011
//
// ------------------------------------------------------------
import System

print '*** 開始 ***'
id_in = argv[0]
population_in = int.Parse (argv[1])

print id_in,population_in

server="localhost"
port="5432"
str_db="city"

str_connect = "Server=" + server + ";Port=" + port + ";User Id=scott;Password=tiger;" + "ENCODING=UNICODE;Database=" + str_db + ";"


dtable = table_manipulate.table_prepare_proc ()

postgre_manipulate.data_fetch_proc (str_connect,dtable)

table_manipulate.update_proc (dtable,id_in,population_in)

postgre_manipulate.data_update_proc (str_connect,dtable)

table_manipulate.display_proc (dtable)

print '*** 終了 ***'
// ------------------------------------------------------------
