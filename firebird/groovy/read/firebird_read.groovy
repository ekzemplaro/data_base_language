// ---------------------------------------------------------------------
//	firebird/groovy/read/firebird_read.groovy
//
//					Aug/25/2015
//
// ---------------------------------------------------------------------
import groovy.sql.Sql
import sql_manipulate

// ---------------------------------------------------------------------
class firebird_read
{

// ---------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***");

	String driver = "org.firebirdsql.jdbc.FBDriver"

	String user     = "sysdba"
	String password = "tiger"
	String database = "/var/tmp/firebird/cities.fdb"

//	def protocol = "jdbc:firebirdsql:localhost/3050:" + database
	def protocol = "jdbc:firebirdsql:host_firebird:" + database

	def sql = Sql.newInstance (protocol, user,password,driver )

	sql_manipulate.display_proc (sql)

	println ("*** 終了 ***");
}
// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------

