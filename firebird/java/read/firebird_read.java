// ---------------------------------------------------------------------
/*
	firebird/java/read/firebird_read.java

					Jun/01/2011

	isql-fb


*/
// ---------------------------------------------------------------------
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;
import java.io.IOException;

// ---------------------------------------------------------------------
public class firebird_read
{
// ---------------------------------------------------------------------
public static void main (String args [])
	throws SQLException, IOException
{
	System.out.println ("*** 開始 ***");

	DriverManager.registerDriver(new org.firebirdsql.jdbc.FBDriver());

	String user     = "sysdba";
	String password = "tiger";
	String database = "/var/tmp/firebird/cities.fdb";

//	String url = "jdbc:firebirdsql:localhost/3050:" + database;
//	String url = "jdbc:firebirdsql:localhost:" + database;
	String url = "jdbc:firebirdsql:172.20.208.103:" + database;

	Connection conn = DriverManager.getConnection (url, user, password);

	System.out.println ("connected.");

	rdb_common.display_proc (conn);

	conn.close();

	System.out.println ("*** 終了 ***");
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------

