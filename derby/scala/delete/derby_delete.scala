// -----------------------------------------------------------------
//	delete/derby_delete.scala
//
//						Aug/01/2011
// -----------------------------------------------------------------
import scala.io.Source
import java.sql._

// -----------------------------------------------------------------
object derby_delete
{
// -----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println	("*** 開始 ***")

	val id_in = args(0)

	println (id_in)

	delete_proc (id_in)

	println	("*** 終了 ***")
}

// -----------------------------------------------------------------
def delete_proc (id_in:String)
{
	val str_connect= "jdbc:derby://localhost:1527/city_aaa;create=true"
	val conn = DriverManager.getConnection (str_connect)

	sql_manipulate.delete_proc (conn,id_in)
	sql_manipulate.display_proc (conn)
	conn.close
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
