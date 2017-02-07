// ---------------------------------------------------------------------
/*
	read/db2_read.scala

					May/30/2011
*/
// ---------------------------------------------------------------------
import scala.io.Source
import java.sql._

// ---------------------------------------------------------------------
object db2_read
{
// ---------------------------------------------------------------------
def main (args: scala.Array[String])
{
	println ("*** 開始 ***")

	Class.forName("COM.ibm.db2.jdbc.app.DB2Driver").newInstance()

	var conn: Connection = null

	val str_connect= "jdbc:db2:cities"

	conn = DriverManager.getConnection (str_connect,"scott","tiger")

	rdb_common.display_proc (conn)

	conn.close

	println ("*** 終了 ***")
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
