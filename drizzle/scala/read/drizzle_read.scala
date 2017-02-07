// -----------------------------------------------------------------
//	read/drizzle_read.scala
//
//						Jul/15/2014
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

	val str_connect= "jdbc:drizzle://localhost:4427/city"

	conn = DriverManager.getConnection (str_connect,"scott","tiger")

	sql_manipulate.display_proc (conn)

	conn.close
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
