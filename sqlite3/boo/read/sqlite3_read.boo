// ------------------------------------------------------------
//	sqlite3_read.boo
//
//						Sep/27/2011
//
// ------------------------------------------------------------
import System
import Mono.Data.Sqlite

print '*** 開始 ***'
file_sqlite3 = argv[0]

print file_sqlite3

dbcon as SqliteConnection = SqliteConnection()

connectionString as string = 'URI=file:' + file_sqlite3

print 'setting ConnectionString using: ' + connectionString
dbcon.ConnectionString = connectionString
print 'open the connection...'
//
dbcon.Open()

dbcmd as SqliteCommand = SqliteCommand()
dbcmd.Connection = dbcon

print 'set command to SELECT FROM MONO_TEST'

dbcmd.CommandText = 'SELECT * FROM cities'
reader as SqliteDataReader
print 'execute reader...'
reader = dbcmd.ExecuteReader()
print 'read and display data...'
while reader.Read():
	print "${reader[0]}\t${reader[1]}\t${reader[2]}\t${reader[3]}"
//
reader.Close ()
dbcmd.Dispose()
dbcon.Close()
print '*** 終了 ***'
// ------------------------------------------------------------
