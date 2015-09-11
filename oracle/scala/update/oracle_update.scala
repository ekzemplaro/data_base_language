// -----------------------------------------------------------------
//	oracle_update.scala
//
//						Aug/05/2015
// -----------------------------------------------------------------
import scala.io.Source
import java.sql._

// -----------------------------------------------------------------
object oracle_update
{
// -----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println	("*** 開始 ***")

	val id_in = args(0)
	val population_in = Integer.parseInt (args(1))

	println (id_in)
	println (population_in)

	var host = "host_oracle";
	var user = "scott";
	var password = "tiger";

	var str_connect = "jdbc:oracl:thin:@" + host + ":1521/xe";

	var conn = DriverManager.getConnection (str_connect,user,password)

	oracle_manipulate.oracle_update_proc (conn,id_in,population_in)

	conn.close ();

	println	("*** 終了 ***")
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
