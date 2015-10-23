// ---------------------------------------------------------------------
//	groovy/delete/drizzle_delete.groovy
//
//					Jul/15/2014
//
// ---------------------------------------------------------------------
import groovy.sql.Sql

import sql_manipulate

// ---------------------------------------------------------------------
class drizzle_delete
{
// ---------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	def id_in=args[0]

	println (id_in)

	def driver = "org.drizzle.jdbc.DrizzleDriver"

	String user     = "scott"
	String password = "tiger"

	def protocol = "jdbc:drizzle://localhost:4427/city"

	def sql = Sql.newInstance (protocol,user,password,driver)

	sql_manipulate.delete_proc (sql,id_in)

	sql_manipulate.display_proc (sql)

	sql.close ()

	println ("*** 終了 ***")
}
// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
