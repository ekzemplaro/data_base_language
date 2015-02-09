// ---------------------------------------------------------------------
//	hsqldb/groovy/read/hsqldb_read.groovy
//
//					Jan/28/2015
//
// ---------------------------------------------------------------------
import groovy.sql.Sql

import sql_manipulate
// ---------------------------------------------------------------------
class hsqldb_read
{
// -------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***");

	def database = "/var/tmp/hsqldb/cities"

	def sql = Sql.newInstance \
		("jdbc:hsqldb:file:" + database,"SA","","org.hsqldb.jdbcDriver")

	sql_manipulate.display_proc (sql)

	sql.close ()

	println ("*** 終了 ***");
}
// ---------------------------------------------------------------------
}

// ---------------------------------------------------------------------
