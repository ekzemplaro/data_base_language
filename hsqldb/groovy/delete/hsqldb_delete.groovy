// ---------------------------------------------------------------------
//	hsqldb/groovy/delete/hsqldb_delete.groovy
//
//					Jan/28/2015
//
// ---------------------------------------------------------------------
import groovy.sql.Sql

import sql_manipulate
// ---------------------------------------------------------------------
class hsqldb_delete
{
// -------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***");

	def id_in=args[0]

	println (id_in)

	def database = "/var/tmp/hsqldb/cities"

	def sql = Sql.newInstance \
		("jdbc:hsqldb:file:" + database,"SA","","org.hsqldb.jdbcDriver")

	sql_manipulate.delete_proc (sql,id_in)

//	sql_manipulate.display_proc (sql)

	sql.close ()

	println ("*** 終了 ***");
}
// ---------------------------------------------------------------------
}

// ---------------------------------------------------------------------
