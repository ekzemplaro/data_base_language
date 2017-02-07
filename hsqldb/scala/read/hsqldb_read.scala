// -----------------------------------------------------------------
//	read/hsqldb_read.scala
//
//						Jul/27/2010
// -----------------------------------------------------------------
import scala.io.Source
import java.sql._

// -----------------------------------------------------------------
object hsqldb_read
{
// -----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println	("*** 開始 ***")

	hsqldb_display_proc ()

	println	("*** 終了 ***")
}

// -----------------------------------------------------------------
def hsqldb_display_proc ()
{
	val database = "file:/var/tmp/hsqldb/cities;shutdown=true"

	val str_connect= "jdbc:hsqldb:" + database

	Class.forName ("org.hsqldb.jdbcDriver")
	val conn = DriverManager.getConnection (str_connect,"SA","")

	sql_manipulate.display_proc (conn)

	conn.close ()
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
