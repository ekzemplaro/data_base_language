// ---------------------------------------------------------------------
//	derby/groovy/delete/derby_delete.groovy
//
//					Aug/06/2010
//
// ---------------------------------------------------------------------
import groovy.sql.Sql

import sql_manipulate

// ---------------------------------------------------------------------
class derby_delete
{
// ---------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***");

	def id_in=args[0]

	println (id_in)

	def driver = "org.apache.derby.jdbc.ClientDriver"

	def protocol = "jdbc:derby://localhost:1527/city_aaa;create=true"

	def sql = Sql.newInstance (protocol, driver)

	sql_manipulate.delete_proc (sql,id_in)

	sql_manipulate.display_proc (sql)

	sql.close ()

	println ("*** 終了 ***");
}
// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
