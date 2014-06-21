// ----------------------------------------------------------------------
/*
	java/delete/maria_delete.java

				Sep/16/2013


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
	System.out.println ("*** 開始 ***");

	String	id = args[0];
	System.out.println ("\tid = " + id);

	String url="jdbc:mysql://localhost/city";
	Connection conn=DriverManager.getConnection (url,"scott","tiger");


	rdb_common.delete_proc	(conn,id);

	rdb_common.display_proc	(conn);

	conn.close ();

	System.out.println ("*** 終了 ***");
}

// ----------------------------------------------------------------------
}
// ----------------------------------------------------------------------
