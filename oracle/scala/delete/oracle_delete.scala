// -----------------------------------------------------------------
//	oracle_delete.scala
//
//						Aug/05/2015
// -----------------------------------------------------------------
import scala.io.Source
import java.sql._

// -----------------------------------------------------------------
object oracle_delete
{
// -----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println	("*** 開始 ***")

	val id_in = args(0)

	println (id_in)

	oracle_delete_proc (id_in)

	println	("*** 終了 ***")
}

// -----------------------------------------------------------------
def oracle_delete_proc (id_in:String)
{
	var host = "host_oracle"
	var user = "scott"
	var password = "tiger"

	val str_connect= "jdbc:oracl:thin:@" + host + ":1521/xe"

	val conn = DriverManager.getConnection (str_connect,"scott","tiger")

	rdb_common.delete_proc (conn,id_in)

	conn.close
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
