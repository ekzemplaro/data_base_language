// ---------------------------------------------------------------------
//	h2/groovy/delete/h2_delete.groovy
//
//					Jun/12/2015
//
// ---------------------------------------------------------------------
import groovy.sql.Sql

import sql_manipulate
// ---------------------------------------------------------------------
class h2_delete
{
// -------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***");

	def db_file=args[0]
	def id_in=args[1]

	println (id_in)

	def sql = Sql.newInstance \
		("jdbc:h2:file:" + db_file, "sa", "", "org.h2.Driver");

	sql_manipulate.delete_proc (sql,id_in)

	sql.close ()

	println ("*** 終了 ***");
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
