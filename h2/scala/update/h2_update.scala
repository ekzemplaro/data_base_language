// -----------------------------------------------------------------
//	update/h2_update.scala
//
//						Jul/01/2011
// -----------------------------------------------------------------
import scala.io.Source
import java.sql._

// -----------------------------------------------------------------
object h2_update
{
// -----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println	("*** 開始 ***")

	val id_in = args(0)
	val population_in = Integer.parseInt (args(1))

	println	(id_in + "\t" + population_in)

	val database = "file:/var/tmp/h2/cities"

	val str_connect= "jdbc:h2:" + database

	val conn = DriverManager.getConnection (str_connect,"SA","")

	sql_manipulate.update_proc (conn,id_in,population_in)
	sql_manipulate.display_proc (conn)

	conn.close
	println	("*** 終了 ***")
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
