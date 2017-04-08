// ----------------------------------------------------------------------
/*
	java/delete/maria_delete.java

				Apr/08/2017

*/
// ----------------------------------------------------------------------
import java.sql.Connection;
import java.sql.DriverManager;

// ----------------------------------------------------------------------
public class maria_delete
{

// ----------------------------------------------------------------------
public static void main (String[] args) throws Exception
{
	System.err.println ("*** 開始 ***");

	String	key_in = args[0];
	System.out.println ("\tkey_in = " + key_in);

	String url="jdbc:mysql://localhost/city";
	String user = "scott";
	String password = "tiger123";
	Connection conn=DriverManager.getConnection (url,user,password);

	rdb_common.delete_proc	(conn,key_in);

	conn.close ();

	System.err.println ("*** 終了 ***");
}

// ----------------------------------------------------------------------
}
// ----------------------------------------------------------------------
