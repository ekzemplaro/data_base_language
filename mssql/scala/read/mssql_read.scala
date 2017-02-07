// -----------------------------------------------------------------
//	read/mssql_read.scala
//
//						Jan/11/2013
// -----------------------------------------------------------------
import scala.io.Source
import java.sql._

// -----------------------------------------------------------------
object mssql_read
{
// -----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println	("*** 開始 ***")

	var conn: Connection = null

//	val str_connect= "jdbc:sqlserver://host_mssql\\SQLEXPRESS;databaseName=city;"
	val str_connect= "jdbc:sqlserver://host_mssql;databaseName=city;"

	conn = DriverManager.getConnection (str_connect,"sa","scott_tiger")

	sql_manipulate.display_proc (conn)
	conn.close

	println	("*** 終了 ***")
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
