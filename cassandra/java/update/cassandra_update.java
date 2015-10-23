// -------------------------------------------------------------- 
//
//	update/cassandra_update.java
//
//					Sep/05/2013
//
// -------------------------------------------------------------- 
import	java.sql.Connection;
import	java.sql.DriverManager;

// -------------------------------------------------------------- 
public class cassandra_update
{
// -------------------------------------------------------------- 
public static void main(String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

	String	key = args[0];
	int	population = Integer.parseInt (args[1]);
	System.out.print ("\tkey = " + key);
	System.out.println ("\tpopulation = " + population);

	String str_connect = "jdbc:cassandra://localhost:9160/city";

	Connection conn = DriverManager.getConnection (str_connect);

	cassandra_manipulate.cassandra_update_proc (conn,key,population);

	conn.close ();

	System.out.println ("*** 終了 ***");
}

// -------------------------------------------------------------- 
}
// -------------------------------------------------------------- 
