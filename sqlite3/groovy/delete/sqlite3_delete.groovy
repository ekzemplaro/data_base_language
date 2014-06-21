// ---------------------------------------------------------------------
//	sqlite3/groovy/delete/sqlite3_delete.groovy
//
//					Aug/25/2010
//
// ---------------------------------------------------------------------
import groovy.sql.Sql

import sql_manipulate

// ---------------------------------------------------------------------
class sqlite3_delete
{
// ---------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***");

	def sqlite3_db = args[0]
	def id_in=args[1]

	println (id_in)

	def driver = "org.sqlite.JDBC"

	def protocol = "jdbc:sqlite:" + sqlite3_db

	def sql = Sql.newInstance (protocol,driver)

	sql_manipulate.delete_proc (sql,id_in)

	sql_manipulate.display_proc (sql)

	sql.close ()

	println ("*** 終了 ***");
}
// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
