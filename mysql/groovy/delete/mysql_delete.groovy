// ---------------------------------------------------------------------
//	mysql/groovy/delete/mysql_delete.groovy
//
//					Nov/22/2010
//
// ---------------------------------------------------------------------
import groovy.sql.Sql

import sql_manipulate

// ---------------------------------------------------------------------
class mysql_delete
{
// ---------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***");

	def id_in=args[0]

	println (id_in)

	def driver = "org.gjt.mm.mysql.Driver"

	String user     = "scott"
	String password = "tiger"

	def protocol = "jdbc:mysql://host_mysql/city"

	def sql = Sql.newInstance (protocol,user,password,driver)

	sql_manipulate.delete_proc (sql,id_in)

	sql_manipulate.display_proc (sql)

	sql.close ()

	println ("*** 終了 ***");
}
// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
