// ---------------------------------------------------------------------
//	mssql/groovy/read/mssql_read.groovy
//
//					Jan/11/2013
//
// ---------------------------------------------------------------------
import groovy.sql.Sql

import sql_manipulate
// ---------------------------------------------------------------------
class mssql_read
{
// ---------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"

	String user     = "sa"
	String password = "scott_tiger"

//	def protocol = 'jdbc:sqlserver://host_mssql\\SQLEXPRESS;databaseName=city'
	def protocol = 'jdbc:sqlserver://host_mssql;databaseName=city'

	def sql = Sql.newInstance (protocol, user,password,driver)

	sql_manipulate.display_proc (sql)

	println ("*** 終了 ***")
}
// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
