// ---------------------------------------------------------------------
//	maria/groovy/update/maria_update.groovy
//
//					May/21/2014
//
// ---------------------------------------------------------------------
import groovy.sql.Sql

import sql_manipulate

// ---------------------------------------------------------------------
class maria_update
{
// ---------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***");

	def id_in=args[0]
	def population_in=args[1]

	println (id_in + "\t" +  population_in)

	def driver = "org.gjt.mm.mysql.Driver"

	String user     = "scott"
	String password = "tiger"

	def protocol = "jdbc:mysql://localhost/city"

	def sql = Sql.newInstance (protocol,user,password,driver)

	sql_manipulate.update_proc (sql,id_in,population_in)

	sql_manipulate.display_proc (sql)

	sql.close ()

	println ("*** 終了 ***");
}
// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
