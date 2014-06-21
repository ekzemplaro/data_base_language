// -------------------------------------------------------------- 
//
//	cassandra_read.scala
//
//						Sep/05/2013
//
// -------------------------------------------------------------- 
import	java.sql.Connection
import	java.sql.DriverManager

// -------------------------------------------------------------- 
object cassandra_read
{
// -------------------------------------------------------------- 
def main (args: Array[String])
{
	println ("*** 開始 ***")

	val str_connect = "jdbc:cassandra://localhost:9160/city"

	var conn = DriverManager.getConnection (str_connect)

	val dict_aa = cassandra_manipulate.cassandra_to_dict_proc (conn)

	conn.close ()

	text_manipulate.dict_display_proc (dict_aa)

	println ("*** 終了 ***")

}

// -------------------------------------------------------------- 
}
// -------------------------------------------------------------- 
