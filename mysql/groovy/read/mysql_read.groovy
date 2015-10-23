// ---------------------------------------------------------------------
//	mysql/groovy/read/mysql_read.groovy
//
//					Nov/22/2010
//
// ---------------------------------------------------------------------
import groovy.sql.Sql

import sql_manipulate

// ---------------------------------------------------------------------
class mysql_read
{
// ---------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	String driver = "org.gjt.mm.mysql.Driver"

	String user     = "scott"
	String password = "tiger"

	def protocol = "jdbc:mysql://host_mysql/city"

	def sql = Sql.newInstance (protocol, user,password,driver )

	sql_manipulate.display_proc (sql)

	println ("*** 終了 ***")
}
// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
