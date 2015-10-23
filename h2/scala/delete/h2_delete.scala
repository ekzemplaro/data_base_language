// -----------------------------------------------------------------
//	delete/h2_delete.scala
//
//						Jun/12/2015
// -----------------------------------------------------------------
import scala.io.Source
import java.sql._

// -----------------------------------------------------------------
object h2_delete
{
// -----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println	("*** 開始 ***")

	val db_file = args(0)

	val database = "file:" + db_file

	val str_connect= "jdbc:h2:" + database

	val id_in = args(1)

	println	(id_in)

	val conn = DriverManager.getConnection (str_connect,"SA","")

	sql_manipulate.delete_proc (conn,id_in)

	conn.close
	println	("*** 終了 ***")
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
