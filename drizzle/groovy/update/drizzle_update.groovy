// ---------------------------------------------------------------------
//	groovy/update/drizzle_update.groovy
//
//					Jul/15/2015
//
// ---------------------------------------------------------------------
import groovy.sql.Sql

import sql_manipulate

// ---------------------------------------------------------------------
class drizzle_update
{
// ---------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	def id_in=args[0]
	def population_in=args[1]

	println (id_in + "\t" +  population_in)

	def driver = "org.drizzle.jdbc.DrizzleDriver"

	String user     = "scott"
	String password = "tiger"

	def protocol = "jdbc:drizzle://localhost:4427/city"

	def sql = Sql.newInstance (protocol,user,password,driver)

	sql_manipulate.update_proc (sql,id_in,population_in)

	sql_manipulate.display_proc (sql)

	sql.close ()

	println ("*** 終了 ***")
}
// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
