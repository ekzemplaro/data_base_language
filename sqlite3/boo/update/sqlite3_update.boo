// ------------------------------------------------------------
//	sqlite3_update.boo
//
//						Sep/27/2011
//
// ------------------------------------------------------------
import System
import Mono.Data.Sqlite

print '*** 開始 ***'
file_sqlite3 = argv[0]
id_in = argv[1]
population_in = argv[2]

print file_sqlite3
print id_in,population_in

dbcon as SqliteConnection = SqliteConnection()

connectionString as string = 'URI=file:' + file_sqlite3

dbcon.ConnectionString = connectionString
//
dbcon.Open()

dbcmd as SqliteCommand = SqliteCommand()
dbcmd.Connection = dbcon

dbcmd.CommandText = "Update cities set population = " + population_in \
	+ ", date_mod='" + DateTime.Now + "' where id = '" + id_in + "'"
dbcmd.ExecuteNonQuery()

dbcmd.Dispose()

dbcon.Close()

print '*** 終了 ***'
// ------------------------------------------------------------
