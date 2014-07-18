// ---------------------------------------------------------------------
//	groovy/read/drizzle_read.groovy
//
//					Jul/15/2014
//
// ---------------------------------------------------------------------
import groovy.sql.Sql

import sql_manipulate

// ---------------------------------------------------------------------
class drizzle_read
{
// ---------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	String driver = "org.drizzle.jdbc.DrizzleDriver"

	String user     = "scott"
	String password = "tiger"

	def protocol = "jdbc:drizzle://localhost:4427/city"

	def sql = Sql.newInstance (protocol, user,password,driver )

	sql_manipulate.display_proc (sql)

	println ("*** 終了 ***")
}
// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
