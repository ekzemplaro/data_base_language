// ---------------------------------------------------------------------
//	h2/groovy/update/h2_update.groovy
//
//					Jun/09/2011
//
// ---------------------------------------------------------------------
import groovy.sql.Sql

import sql_manipulate
// ---------------------------------------------------------------------
class h2_update
{
// -------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***");

	def id_in=args[0]
	def population_in=args[1]

	println (id_in + "\t" +  population_in)

	def sql = Sql.newInstance \
		("jdbc:h2:file:/var/tmp/h2/cities", "sa", "", "org.h2.Driver");

	sql_manipulate.update_proc (sql,id_in,population_in)

	sql.close ()

	println ("*** 終了 ***");
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
