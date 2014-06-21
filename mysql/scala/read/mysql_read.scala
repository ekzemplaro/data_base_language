// -----------------------------------------------------------------
//	read/mysql_read.scala
//
//						Jul/31/2011
// -----------------------------------------------------------------
import scala.io.Source
import java.sql._

// -----------------------------------------------------------------
object mysql_read
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
	var conn: Connection = null

	val str_connect= "jdbc:mysql://host_mysql/city"

	conn = DriverManager.getConnection (str_connect,"scott","tiger")

	sql_manipulate.display_proc (conn)

	conn.close
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
