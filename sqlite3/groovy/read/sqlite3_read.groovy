// ---------------------------------------------------------------------
//	sqlite3/groovy/read/sqlite3_read.groovy
//
//					Aug/27/2010
//
// ---------------------------------------------------------------------
import groovy.sql.Sql
import sql_manipulate
// ---------------------------------------------------------------------
class sqlite3_read
{
// ---------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	String driver = "org.sqlite.JDBC"

	def sqlite3_db = args[0]

	def protocol = "jdbc:sqlite:" + sqlite3_db

	def sql = Sql.newInstance (protocol, driver )

	sql_manipulate.display_proc (sql)

	sql.close ()

	println ("*** 終了 ***")

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
