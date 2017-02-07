// -----------------------------------------------------------------
//	update/h2_update.scala
//
//						Jun/12/2015
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

	val db_file = args(0)

	val database = "file:" + db_file

	val str_connect= "jdbc:h2:" + database

	val id_in = args(1)
	val population_in = Integer.parseInt (args(2))

	println	(id_in + "\t" + population_in)

	val conn = DriverManager.getConnection (str_connect,"SA","")

	sql_manipulate.update_proc (conn,id_in,population_in)

	conn.close
	println	("*** 終了 ***")
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
