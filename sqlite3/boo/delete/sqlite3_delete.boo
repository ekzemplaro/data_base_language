// ------------------------------------------------------------
//	sqlite3_delete.boo
//
//						Sep/27/2011
//
// ------------------------------------------------------------
import System
import Mono.Data.Sqlite

print '*** 開始 ***'
file_sqlite3 = argv[0]
id_in = argv[1]

print file_sqlite3
print id_in

dbcon as SqliteConnection = SqliteConnection()

connectionString as string = 'URI=file:' + file_sqlite3

dbcon.ConnectionString = connectionString
//
dbcon.Open()

dbcmd as SqliteCommand = SqliteCommand()
dbcmd.Connection = dbcon


dbcmd.CommandText = "Delete from cities where id = '" + id_in + "'"
dbcmd.ExecuteNonQuery()

dbcmd.Dispose()

dbcon.Close()

print '*** 終了 ***'
// ------------------------------------------------------------
