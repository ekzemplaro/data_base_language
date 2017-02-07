// ---------------------------------------------------------------------
//	postgre/groovy/read/postgre_read.groovy
//
//					Dec/21/2010
//
// ---------------------------------------------------------------------
import groovy.sql.Sql
import sql_manipulate

// ---------------------------------------------------------------------
class postgre_read
{
// ---------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***");

	String driver = "org.postgresql.Driver"

	String user     = "scott"
	String password = "tiger"

	def protocol = "jdbc:postgresql://localhost/city"

	def sql = Sql.newInstance (protocol, user,password,driver )

	sql_manipulate.display_proc (sql)

	println ("*** 終了 ***");

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
