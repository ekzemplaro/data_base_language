// ----------------------------------------------------------------------
/*
	db2_update.scala

				May/30/2011

*/
// ----------------------------------------------------------------------
import scala.io.Source
import java.sql._

// ----------------------------------------------------------------------
object db2_update
{

// ----------------------------------------------------------------------
def main (args: scala.Array[String])
{
	println ("*** 開始 ***")

	val id_in = args(0)
	val population_in = Integer.parseInt (args(1))

	println (id_in)
	println (population_in)

	Class.forName("COM.ibm.db2.jdbc.app.DB2Driver").newInstance()

	var conn: Connection = null

	val str_connect= "jdbc:db2:cities"

	conn = DriverManager.getConnection (str_connect,"scott","tiger")

	rdb_common.update_proc	(conn,id_in,population_in)

	rdb_common.display_proc (conn)

	conn.close

	println ("*** 終了 ***")
}

// ----------------------------------------------------------------------
}
// ----------------------------------------------------------------------
