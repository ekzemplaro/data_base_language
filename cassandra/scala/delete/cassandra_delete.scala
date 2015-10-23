// -------------------------------------------------------------- 
//
//	cassandra_delete.scala
//
//						Sep/05/2013
//
// -------------------------------------------------------------- 
import	java.sql.Connection
import	java.sql.DriverManager

// -------------------------------------------------------------- 
object cassandra_delete
{
// -------------------------------------------------------------- 
def main (args: Array[String])
{
	println ("*** 開始 ***")

	val key = args(0)

	val str_connect = "jdbc:cassandra://localhost:9160/city"

	var conn = DriverManager.getConnection (str_connect)

	cassandra_manipulate.cassandra_delete_proc (conn,key)

	conn.close ()

	println ("*** 終了 ***")

}

// -------------------------------------------------------------- 
}
// -------------------------------------------------------------- 
