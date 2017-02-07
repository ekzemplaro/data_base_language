// ---------------------------------------------------------------------
//	postgre/groovy/delete/postgre_delete.groovy
//
//					Jul/16/2011
//
// ---------------------------------------------------------------------
import groovy.sql.Sql
import sql_manipulate

// ---------------------------------------------------------------------
class postgre_delete
{
// ---------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***");

	def id_in=args[0]

	println (id_in)

	def driver = "org.postgresql.Driver"

	String user     = "scott"
	String password = "tiger"

	def protocol = "jdbc:postgresql://localhost/city"

	def sql = Sql.newInstance (protocol,user,password,driver)

	sql_manipulate.delete_proc (sql,id_in)

	sql_manipulate.display_proc (sql)

	sql.close ()

	println ("*** 終了 ***");
}
// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
