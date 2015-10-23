// -----------------------------------------------------------------
//	sqlite3_read.scala
//
//						Jul/27/2010
// -----------------------------------------------------------------
import scala.io.Source
import java.sql._

// -----------------------------------------------------------------
object sqlite3_read
{
// -----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println	("*** 開始 ***")

	if (0 < args.length)
		{
		val file_db = args(0)

		display_proc (file_db)
		}
	else
		{
		Console.err.println ("*** error ***")
		}

	println	("*** 終了 ***")
}

// -----------------------------------------------------------------
def display_proc (file_db:String)
{
	var conn: Connection = null

	Class.forName("org.sqlite.JDBC")
	conn = DriverManager.getConnection("jdbc:sqlite:" + file_db)

	sql_manipulate.display_proc (conn)
	conn.close

}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
