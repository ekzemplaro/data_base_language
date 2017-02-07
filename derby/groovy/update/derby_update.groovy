// ---------------------------------------------------------------------
//	derby/groovy/update/derby_update.groovy
//
//					Aug/06/2010
//
// ---------------------------------------------------------------------
import groovy.sql.Sql

import sql_manipulate

// ---------------------------------------------------------------------
class derby_update
{
// ---------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***");

	def id_in=args[0]
	def population_in=args[1]

	println (id_in + "\t" +  population_in)

	def driver = "org.apache.derby.jdbc.ClientDriver"

	def protocol = "jdbc:derby://localhost:1527/city_aaa;create=true"

	def sql = Sql.newInstance (protocol, driver)

	sql_manipulate.update_proc (sql,id_in,population_in)

	sql_manipulate.display_proc (sql)

	sql.close ()

	println ("*** 終了 ***");
}
// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
