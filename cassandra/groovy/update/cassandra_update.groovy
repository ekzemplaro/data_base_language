// -------------------------------------------------------------- 
//
//	update/cassandra_update.groovy
//
//						Sep/05/2013
//
// -------------------------------------------------------------- 
import	java.sql.Connection
import	java.sql.DriverManager

import	cassandra_manipulate
// -------------------------------------------------------------- 
class cassandra_update
{
// -------------------------------------------------------------- 
static void main(args)
{
	println ("*** 開始 ***")

	def	key = args[0]
	def	population = Integer.parseInt (args[1])
	print ("\tkey = " + key)
	println ("\tpopulation = " + population)

	def str_connect = "jdbc:cassandra://localhost:9160/city"

	def conn = DriverManager.getConnection (str_connect)
    
	cassandra_manipulate.cassandra_update_proc (conn,key,population)

	println ("*** 終了 ***")
}

// -------------------------------------------------------------- 
}
// -------------------------------------------------------------- 
