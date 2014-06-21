// ---------------------------------------------------------------------
//	firebird/groovy/update/firebird_update.groovy
//
//					Nov/24/2010
//
// ---------------------------------------------------------------------
import groovy.sql.Sql

import sql_manipulate

// ---------------------------------------------------------------------
class firebird_update
{
// ---------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***");

	def id_in=args[0]
	def population_in=args[1]

	println (id_in + "\t" +  population_in)

	def driver = "org.firebirdsql.jdbc.FBDriver"

	String user     = "sysdba"
	String password = "tiger"
	String database = "/var/tmp/firebird/cities.fdb"

	def protocol = "jdbc:firebirdsql:localhost/3050:" + database


	def sql = Sql.newInstance (protocol,user,password,driver)

	sql_manipulate.update_proc (sql,id_in,population_in)

	sql_manipulate.display_proc (sql)

	sql.close ()

	println ("*** 終了 ***");
}
// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
