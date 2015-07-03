// ---------------------------------------------------------------------
//	h2/groovy/update/h2_update.groovy
//
//					Jun/12/2015
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

	def db_file=args[0]
	def id_in=args[1]
	def population_in=args[2]

	println (id_in + "\t" +  population_in)

	def sql = Sql.newInstance \
		("jdbc:h2:file:" + db_file, "sa", "", "org.h2.Driver");

	sql_manipulate.update_proc (sql,id_in,population_in)

	sql.close ()

	println ("*** 終了 ***");
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
