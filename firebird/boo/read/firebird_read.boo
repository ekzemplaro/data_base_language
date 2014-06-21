// ----------------------------------------------------------------
//
//	read/firebird_read.boo
//
//					Nov/11/2011
//
//
// ----------------------------------------------------------------
import System

import FirebirdSql.Data.FirebirdClient

// ----------------------------------------------------------------
print "*** 開始 ***"


user = "sysdba"
passwd = "tiger"
dbname = "/var/tmp/firebird/cities.fdb"

ConnectionString = "User ID=" + user + ";Password=" + passwd + ";Database=" + dbname + ";DataSource=localhost;Charset=NONE;"

// conn = new FbConnection(ConnectionString)
conn = FbConnection(ConnectionString)
conn.Open()

fbd_manipulate.firebird_display_proc (conn)

conn.Close() 

print "*** 終了 ***"


// ----------------------------------------------------------------
