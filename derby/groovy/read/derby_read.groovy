// ---------------------------------------------------------------------
//	derby/groovy/read/derby_read.groovy
//
//					Aug/03/2010
//
// ---------------------------------------------------------------------
import groovy.sql.Sql

import sql_manipulate

// ---------------------------------------------------------------------
class derby_read
{
// ---------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***");

	def driver = "org.apache.derby.jdbc.ClientDriver"

	def protocol = "jdbc:derby://localhost:1527/city_aaa;create=true"

	def sql = Sql.newInstance (protocol, driver)

	sql_manipulate.display_proc (sql)

	sql.close ()

	println ("*** 終了 ***");
}
// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
