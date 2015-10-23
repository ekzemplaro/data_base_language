// -----------------------------------------------------------------
//	read/derby_read.scala
//
//						Aug/01/2011
// -----------------------------------------------------------------
import scala.io.Source
import java.sql._

// -----------------------------------------------------------------
object derby_read
{
// -----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println	("*** 開始 ***")

	display_proc ()

	println	("*** 終了 ***")
}

// -----------------------------------------------------------------
def display_proc ()
{
	val str_connect= "jdbc:derby://localhost:1527/city_aaa;create=true"
	val conn = DriverManager.getConnection (str_connect)

	sql_manipulate.display_proc (conn)
	conn.close
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
