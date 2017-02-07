// -------------------------------------------------------------- 
//
//	cassandra_read.groovy
//
//						Sep/05/2013
//
// -------------------------------------------------------------- 
import	java.sql.Connection
import	java.sql.DriverManager

import	cassandra_manipulate
import	text_manipulate
// -------------------------------------------------------------- 
class cassandra_read
{
// -------------------------------------------------------------- 
static void main (args) throws Exception
{
	println ("*** 開始 ***")

	def str_connect = "jdbc:cassandra://localhost:9160/city"

	def conn = DriverManager.getConnection (str_connect)

	println ("*** ppp ***")
	def dict_aa = cassandra_manipulate.cassandra_to_dict_proc (conn)
	println ("*** qqq ***")

	conn.close ()

	text_manipulate.dict_display_proc (dict_aa)

	println ("*** 終了 ***")

}

// -------------------------------------------------------------- 
}
// -------------------------------------------------------------- 
