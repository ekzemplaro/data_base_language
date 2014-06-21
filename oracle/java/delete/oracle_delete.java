// ----------------------------------------------------------------------
/*
	oracle_delete.java

				May/23/2011


*/
// ----------------------------------------------------------------------
import java.sql.Connection;
import java.sql.DriverManager;

// ----------------------------------------------------------------------
public class oracle_delete
{

// ----------------------------------------------------------------------
public static void main (String[] args) throws Exception
{
	Class.forName ("oracle.jdbc.driver.OracleDriver");

	System.out.println ("*** 開始 *** oracle_update ***");

	String	id = args[0];
	System.out.println ("\tid = " + id);

	Connection conn =
		DriverManager.getConnection
			("jdbc:oracl:thin:@spn109:1521:xe","scott","tiger");

	rdb_common.delete_proc	(conn,id);

	rdb_common.display_proc	(conn);

	conn.close ();

	System.out.println ("*** 終了 ***");
}

// ----------------------------------------------------------------------
}
// ----------------------------------------------------------------------
