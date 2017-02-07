// -----------------------------------------------------------------
//	read/postgre_read.scala
//
//						Jul/31/2011
// -----------------------------------------------------------------
import scala.io.Source
import java.sql._

// -----------------------------------------------------------------
object postgre_read
{
// -----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println	("*** 開始 ***")

	val str_connect= "jdbc:postgresql://localhost/city"

	val conn = DriverManager.getConnection (str_connect,"scott","tiger")

	sql_manipulate.display_proc (conn)
	conn.close

	println	("*** 終了 ***")
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
