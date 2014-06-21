// ---------------------------------------------------------------------
//	hsqldb/groovy/read/hsqldb_read.groovy
//
//					Aug/06/2010
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

	def source = new org.hsqldb.jdbc.jdbcDataSource ()

	source.database = 'jdbc:hsqldb:file:/var/tmp/hsqldb/cities'

	source.user = 'SA'
	source.password = ''

	def sql = new Sql (source)

	sql_manipulate.display_proc (sql)

	sql.close ()

	println ("*** 終了 ***");
}
// ---------------------------------------------------------------------
}

// ---------------------------------------------------------------------
