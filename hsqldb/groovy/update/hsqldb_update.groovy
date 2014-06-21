// ---------------------------------------------------------------------
//	hsqldb/groovy/update/hsqldb_update.groovy
//
//					May/30/2011
//
// ---------------------------------------------------------------------
import groovy.sql.Sql
import sql_manipulate
// ---------------------------------------------------------------------
class hsqldb_update
{
// -------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***");

	def id_in=args[0]
	def population_in=args[1]

	println (id_in + "\t" +  population_in)

	def source = new org.hsqldb.jdbc.jdbcDataSource ()

	source.database = 'jdbc:hsqldb:file:/var/tmp/hsqldb/cities;shutdown=true'

	source.user = 'SA'
	source.password = ''

	def sql = new Sql (source)

	sql_manipulate.update_proc (sql,id_in,population_in)

//	sql.commit ()

	sql_manipulate.display_proc (sql)

	sql.close ()
	println ("*** 終了 ***");
}
// ---------------------------------------------------------------------
}

// ---------------------------------------------------------------------
