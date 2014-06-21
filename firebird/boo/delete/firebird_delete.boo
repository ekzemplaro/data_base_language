// ----------------------------------------------------------------
//
//	firebird_delete.boo
//
//					Nov/14/2011
//
//
// ----------------------------------------------------------------
import	System

import	FirebirdSql.Data.FirebirdClient

// ----------------------------------------------------------------
print '*** 開始 ***'
id_in = argv[0]

print id_in


user = "sysdba"
passwd = "tiger"
dbname = "/var/tmp/firebird/cities.fdb"

ConnectionString = "User ID=" + user + ";Password=" + passwd + ";Database=" + dbname + ";DataSource=localhost;Charset=NONE;"

conn = FbConnection(ConnectionString)
conn.Open()


fbd_manipulate.delete_proc (conn,id_in)

conn.Close() 

print "*** 終了 ***"

// ----------------------------------------------------------------
