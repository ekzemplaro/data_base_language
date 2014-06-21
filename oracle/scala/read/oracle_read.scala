// -----------------------------------------------------------------
//	oracle_read.scala
//
//						Sep/27/2010
// -----------------------------------------------------------------
import scala.io.Source
import java.sql._

// -----------------------------------------------------------------
object oracle_read
{
// -----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println	("*** 開始 ***")

	var conn: Connection = null

	val str_connect= "jdbc:oracl:thin:@spn109:1521/xe"

	Class.forName ("oracle.jdbc.driver.OracleDriver")

	conn = DriverManager.getConnection (str_connect,"scott","tiger")

	rdb_common.display_proc (conn)
	conn.close

	println	("*** 終了 ***")
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
