// ---------------------------------------------------------------------
//	sqlite3/groovy/update/sqlite3_update.groovy
//
//					May/26/2011
//
// ---------------------------------------------------------------------
import groovy.sql.Sql

import sql_manipulate

// ---------------------------------------------------------------------
class sqlite3_update
{
// ---------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***");

	def sqlite3_db = args[0]
	def id_in=args[1]
	def population_in=args[2]

	println (id_in + "\t" +  population_in)

	def driver = "org.sqlite.JDBC"

	def protocol = "jdbc:sqlite:" + sqlite3_db

	def sql = Sql.newInstance (protocol,driver)

	sql_manipulate.update_proc (sql,id_in,population_in)

	sql_manipulate.display_proc (sql)

	sql.close ()

	println ("*** 終了 ***");
}
// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
