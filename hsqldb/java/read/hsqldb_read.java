// ---------------------------------------------------------------------
/*
	hsqldb/java/read/hsqldb_read.java

					Jun/12/2015

*/
// ---------------------------------------------------------------------
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

// ---------------------------------------------------------------------
public class hsqldb_read
{
// ---------------------------------------------------------------------
public static void main (String args [])
	throws SQLException, ClassNotFoundException,
	InstantiationException, IllegalAccessException
{
	System.out.println ("*** 開始 ***");

	Class.forName ("org.hsqldb.jdbcDriver");

	String db_file = args[0];
	System.out.println (db_file);
	String database = "file:" + db_file + ";shutdown=true";

	Connection conn =
		DriverManager.getConnection("jdbc:hsqldb:" + database, "SA","");

	Statement ss = conn.createStatement ();

	rdb_common.display_proc (conn);

	ss.close ();

	conn.close();

	System.out.println ("*** 終了 ***");
}

// ---------------------------------------------------------------------
}

// ---------------------------------------------------------------------
