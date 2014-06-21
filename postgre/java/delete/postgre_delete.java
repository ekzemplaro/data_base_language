// ----------------------------------------------------------------------
/*
	java/delete/postgre_delete.java

				May/26/2011


*/
// ----------------------------------------------------------------------
import java.sql.Connection;
import java.sql.DriverManager;

// ----------------------------------------------------------------------
public class postgre_delete
{

// ----------------------------------------------------------------------
public static void main (String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

	String	id = args[0];
	System.out.println ("\tid = " + id);

	Connection conn =
		DriverManager.getConnection
			("jdbc:postgresql://localhost/city","scott","tiger");

	rdb_common.delete_proc	(conn,id);

	rdb_common.display_proc	(conn);

	conn.close ();

	System.out.println ("*** 終了 ***");
}

// ----------------------------------------------------------------------
}
// ----------------------------------------------------------------------
