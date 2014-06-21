// ---------------------------------------------------------------------- 
/*
	cassandra_read.java

						Sep/05/2013
*/
// ---------------------------------------------------------------------- 
import	java.util.HashMap;

import	java.sql.Connection;
import	java.sql.DriverManager;
// ---------------------------------------------------------------------- 
public class cassandra_read
{
 
// ---------------------------------------------------------------------- 
public static final void main(String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

	String str_connect = "jdbc:cassandra://localhost:9160/city";
//	String str_connect = "jdbc:cassandra://localhost:9170/city";

	Connection conn = DriverManager.getConnection (str_connect);

	HashMap <String, HashMap <String,String>>
		dict_aa = cassandra_manipulate.cassandra_to_dict_proc (conn);

	conn.close ();

	text_manipulate.dict_display_proc (dict_aa);

	System.out.println ("*** 終了 ***");
}

// ---------------------------------------------------------------------- 
}
// ---------------------------------------------------------------------- 
