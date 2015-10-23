// ----------------------------------------------------------------
//
//	firebird_update.boo
//
//					Nov/14/2011
//
//
// ----------------------------------------------------------------
import	System

import	FirebirdSql.Data.FirebirdClient

// ----------------------------------------------------------------
print "*** 開始 ***"
id_in = argv[0]
population_in = int.Parse (argv[1])

print id_in,population_in

user = "sysdba"
passwd = "tiger"
dbname = "/var/tmp/firebird/cities.fdb"

ConnectionString = "User ID=" + user + ";Password=" + passwd + ";Database=" + dbname + ";DataSource=localhost;Charset=NONE;"

conn = FbConnection(ConnectionString)
conn.Open()


fbd_manipulate.update_proc (conn,id_in,population_in);

conn.Close() 

print "*** 終了 ***"


// ----------------------------------------------------------------
