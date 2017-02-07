// ---------------------------------------------------------------------
//	hsqldb/groovy/update/hsqldb_update.groovy
//
//					Jan/28/2015
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

	def database = "/var/tmp/hsqldb/cities"

	def sql = Sql.newInstance \
		("jdbc:hsqldb:file:" + database,"SA","","org.hsqldb.jdbcDriver")

	sql_manipulate.update_proc (sql,id_in,population_in)

//	sql.commit ()

	sql_manipulate.display_proc (sql)

	sql.close ()
	println ("*** 終了 ***");
}
// ---------------------------------------------------------------------
}

// ---------------------------------------------------------------------
