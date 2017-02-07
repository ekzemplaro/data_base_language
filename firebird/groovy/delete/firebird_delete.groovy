// ---------------------------------------------------------------------
//	firebird/groovy/delete/firebird_delete.groovy
//
//					Aug/25/2015
//
// ---------------------------------------------------------------------
import groovy.sql.Sql

import sql_manipulate

// ---------------------------------------------------------------------
class firebird_delete
{
// ---------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***");

	def id_in=args[0]

	println (id_in)

	def driver = "org.firebirdsql.jdbc.FBDriver"

	String user     = "sysdba"
	String password = "tiger"
	String database = "/var/tmp/firebird/cities.fdb"

//	def protocol = "jdbc:firebirdsql:localhost/3050:" + database
	def protocol = "jdbc:firebirdsql:host_firebird:" + database

	def sql = Sql.newInstance (protocol,user,password,driver)

	sql_manipulate.delete_proc (sql,id_in)

	sql.close ()

	println ("*** 終了 ***");
}
// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
