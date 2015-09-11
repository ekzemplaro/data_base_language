// -----------------------------------------------------------------
//	oracle_read.scala
//
//						Aug/05/2015
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

	var host = "host_oracle"
	var user = "scott"
	var password = "tiger"

	val str_connect= "jdbc:oracl:thin:@" + host + ":1521/xe"

	var conn: Connection = null

	conn = DriverManager.getConnection (str_connect,user,password)

	rdb_common.display_proc (conn)

	conn.close

	println	("*** 終了 ***")
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
