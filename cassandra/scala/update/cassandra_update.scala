// -------------------------------------------------------------- 
//
//	cassandra_update.scala
//
//						Sep/05/2013
//
// -------------------------------------------------------------- 
import	java.sql.Connection
import	java.sql.DriverManager

// -------------------------------------------------------------- 
object cassandra_update
{
// -------------------------------------------------------------- 
def main (args: Array[String])
{
	println ("*** 開始 ***")

	val key = args(0)
	val population_in = args(1).toInt

	val str_connect = "jdbc:cassandra://localhost:9160/city"

	var conn = DriverManager.getConnection (str_connect)

	cassandra_manipulate.cassandra_update_proc (conn,key,population_in)

	conn.close ()

	println ("*** 終了 ***")

}

// -------------------------------------------------------------- 
}
// -------------------------------------------------------------- 
