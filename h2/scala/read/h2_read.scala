// -----------------------------------------------------------------
//	read/h2_read.scala
//
//						Aug/01/2011
// -----------------------------------------------------------------
import scala.io.Source
import java.sql._

// -----------------------------------------------------------------
object h2_read
{
// -----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println	("*** 開始 ***")

	val database = "file:/var/tmp/h2/cities"

	val str_connect= "jdbc:h2:" + database

	val conn = DriverManager.getConnection (str_connect,"SA","")

	sql_manipulate.display_proc (conn)

	conn.close

	println	("*** 終了 ***")
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
