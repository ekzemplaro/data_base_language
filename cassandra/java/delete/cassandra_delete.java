// -------------------------------------------------------------- 
//
//	cassandra_delete.java
//
//					Sep/05/2013
//
// -------------------------------------------------------------- 
import	java.sql.Connection;
import	java.sql.DriverManager;

// -------------------------------------------------------------- 
public class cassandra_delete
{
// -------------------------------------------------------------- 
public static void main(String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

	String	key = args[0];
	System.out.print ("\tkey = " + key);

	String str_connect = "jdbc:cassandra://localhost:9160/city";

	Connection conn = DriverManager.getConnection (str_connect);

	cassandra_manipulate.cassandra_delete_proc (conn,key);

	conn.close ();

	System.out.println ("*** 終了 ***");
}

// -------------------------------------------------------------- 
}
// -------------------------------------------------------------- 
