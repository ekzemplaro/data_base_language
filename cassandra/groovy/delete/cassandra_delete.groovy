// -------------------------------------------------------------- 
//
//	cassandra_delete.groovy
//
//					Sep/05/2013
//
// -------------------------------------------------------------- 
import	java.sql.Connection
import	java.sql.DriverManager

import	cassandra_manipulate
// -------------------------------------------------------------- 
class cassandra_delete
{
// -------------------------------------------------------------- 
static void main(args)
{
	println ("*** 開始 ***")

	def	key = args[0]
	print ("\tkey = " + key)

	def str_connect = "jdbc:cassandra://localhost:9160/city"

	def conn = DriverManager.getConnection (str_connect)
    
	cassandra_manipulate.cassandra_delete_proc (conn,key)

	println ("*** 終了 ***")
}

// -------------------------------------------------------------- 
}
// -------------------------------------------------------------- 
