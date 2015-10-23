// ---------------------------------------------------------------------
/*
	read/db2_read.groovy

					May/30/2011
*/
// ---------------------------------------------------------------------
import groovy.sql.Sql

import sql_manipulate
// ---------------------------------------------------------------------
class db2_read
{
// ---------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	String driver = "COM.ibm.db2.jdbc.app.DB2Driver"

	String user = "scott"
	String pass = "tiger"


	println ("*** db2_read *** eeee ***")

	def protocol = "jdbc:db2:cities"

	def sql = Sql.newInstance (protocol, user,pass,driver )

	sql_manipulate.display_proc (sql);

	sql.close ()

	println ("*** 終了 ***")
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
