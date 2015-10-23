// -----------------------------------------------------------------
//	delete/mysql_delete.scala
//
//						Jul/31/2011
// -----------------------------------------------------------------
import scala.io.Source
import java.sql._

// -----------------------------------------------------------------
object mysql_delete
{
// -----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println	("*** 開始 ***")

	val id_in = args(0)

	println (id_in)

	mysql_delete_proc (id_in)

	println	("*** 終了 ***")
}

// -----------------------------------------------------------------
def mysql_delete_proc (id_in:String)
{
	val str_connect= "jdbc:mysql://host_mysql/city"

	val conn = DriverManager.getConnection (str_connect,"scott","tiger")

	sql_manipulate.delete_proc (conn,id_in)
	sql_manipulate.display_proc (conn)

	conn.close
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
