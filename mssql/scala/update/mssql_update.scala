// -----------------------------------------------------------------
//	update/mssql_update.scala
//
//						Jan/11/2013
// -----------------------------------------------------------------
import scala.io.Source
import java.sql._

// -----------------------------------------------------------------
object mssql_update
{
// -----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println	("*** 開始 ***")

	val id_in = args(0)
	val population_in = Integer.parseInt (args(1))

	println (id_in)
	println (population_in)

	mssql_update_proc (id_in,population_in)

	println	("*** 終了 ***")
}

// -----------------------------------------------------------------
def mssql_update_proc (id_in:String,population_in:Int)
{
//	val str_connect= "jdbc:sqlserver://host_mssql\\SQLEXPRESS;databaseName=city;"
	val str_connect= "jdbc:sqlserver://host_mssql;databaseName=city;"

	val conn = DriverManager.getConnection (str_connect,"sa","scott_tiger")

	sql_manipulate.update_proc (conn,id_in,population_in)
	sql_manipulate.display_proc (conn)

	conn.close
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
