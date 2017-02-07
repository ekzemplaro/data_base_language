// ----------------------------------------------------------------------
/*
	java/delete/maria_delete.java

				Sep/05/2016


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
	Connection conn=DriverManager.getConnection (url,"scott","tiger");

	rdb_common.delete_proc	(conn,key_in);

	conn.close ();

	System.err.println ("*** 終了 ***");
}

// ----------------------------------------------------------------------
}
// ----------------------------------------------------------------------
