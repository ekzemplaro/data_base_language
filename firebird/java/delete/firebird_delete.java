// ----------------------------------------------------------------------
/*
	java/delete/firebird_delete.java

				Jun/01/2011


*/
// ----------------------------------------------------------------------
import java.sql.DriverManager;
import java.sql.Connection;


// ----------------------------------------------------------------------
public class firebird_delete
{

// ----------------------------------------------------------------------
public static void main (String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

	String	id = args[0];
	System.out.println ("\tid = " + id);

	DriverManager.registerDriver(new org.firebirdsql.jdbc.FBDriver());

	String user     = "sysdba";
	String password = "tiger";
	String database = "/var/tmp/firebird/cities.fdb";

	Connection conn = DriverManager.getConnection
		("jdbc:firebirdsql:localhost/3050:" +
		database, user, password);


	rdb_common.delete_proc	(conn,id);

	rdb_common.display_proc	(conn);

	conn.close ();

	System.out.println ("*** 終了 ***");
}

// ----------------------------------------------------------------------
}
// ----------------------------------------------------------------------
