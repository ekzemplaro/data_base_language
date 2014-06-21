// ---------------------------------------------------------------------
//	mssql/groovy/delete/mssql_delete.groovy
//
//					Jan/11/2013
//
// ---------------------------------------------------------------------
import groovy.sql.Sql

import sql_manipulate

// ---------------------------------------------------------------------
class mssql_delete
{
// ---------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***");

	def id_in=args[0]

	println (id_in)

	def driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"

	String user     = "sa"
	String password = "scott_tiger"

//	def protocol = "jdbc:sqlserver://host_mssql\\SQLEXPRESS;databaseName=city"
	def protocol = "jdbc:sqlserver://host_mssql;databaseName=city"

	def sql = Sql.newInstance (protocol,user,password,driver)

	sql_manipulate.delete_proc (sql,id_in)

	sql_manipulate.display_proc (sql)

	sql.close ()

	println ("*** 終了 ***");
}
// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
