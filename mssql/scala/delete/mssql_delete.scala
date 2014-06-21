// -----------------------------------------------------------------
//	delete/mssql_delete.scala
//
//						Jan/11/2013
// -----------------------------------------------------------------
import scala.io.Source
import java.sql._

// -----------------------------------------------------------------
object mssql_delete
{
// -----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println	("*** 開始 ***")

	val id_in = args(0)

	println (id_in)

	mssql_delete_proc (id_in)

	println	("*** 終了 ***")
}

// -----------------------------------------------------------------
def mssql_delete_proc (id_in:String)
{
//	val str_connect= "jdbc:sqlserver://host_mssql\\SQLEXPRESS;databaseName=city;"
	val str_connect= "jdbc:sqlserver://host_mssql;databaseName=city;"

	val conn = DriverManager.getConnection (str_connect,"sa","scott_tiger")

	sql_manipulate.delete_proc (conn,id_in)
	sql_manipulate.display_proc (conn)

	conn.close
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
