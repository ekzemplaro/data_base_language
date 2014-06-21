// ----------------------------------------------------------------------
/*
	java/delete/sqlite3_delete.java

				May/26/2011


*/
// ----------------------------------------------------------------------
import java.util.Date;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

// ----------------------------------------------------------------------
public class sqlite3_delete
{

// ----------------------------------------------------------------------
public static void main (String[] args) throws Exception
{
	Class.forName ("org.sqlite.JDBC");

	System.out.println ("*** 開始 *** sqlite3_update ***");

	String file_name = args[0];

	String	id = args[1];
	System.out.println ("\tid = " + id);

	Connection conn = DriverManager.getConnection
		("jdbc:sqlite:" + file_name);

	System.out.println ("");

	rdb_common.delete_proc	(conn,id);

	rdb_common.display_proc	(conn);

	conn.close ();

	System.out.println ("*** 終了 ***");
}

// ----------------------------------------------------------------------
}
// ----------------------------------------------------------------------
