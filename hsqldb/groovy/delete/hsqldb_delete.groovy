// ---------------------------------------------------------------------
//	hsqldb/groovy/delete/hsqldb_delete.groovy
//
//					May/30/2011
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

	def source = new org.hsqldb.jdbc.jdbcDataSource ()

	source.database = 'jdbc:hsqldb:file:/var/tmp/hsqldb/cities;shutdown=true'

	source.user = 'SA'
	source.password = ''

	def sql = new Sql (source)

	sql_manipulate.delete_proc (sql,id_in)

	sql_manipulate.display_proc (sql)

	println ("*** 終了 ***");
}
// ---------------------------------------------------------------------
}

// ---------------------------------------------------------------------
