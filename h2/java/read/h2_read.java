// ---------------------------------------------------------------------
/*
	h2/java/read/h2_read.java

						Jun/12/2015

*/
// ---------------------------------------------------------------------
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;

// ---------------------------------------------------------------------
public class h2_read
{
// ---------------------------------------------------------------------
public static void main (String args [])
	throws SQLException,
	InstantiationException, IllegalAccessException
{
	System.out.println ("*** 開始 ***");

	String db_file = args[0];
	System.out.println (db_file);

	String database = "file:" + db_file;

	Connection conn =
		DriverManager.getConnection("jdbc:h2:" + database, "SA","");

	System.out.println ("*** connected. ***");

	rdb_common.display_proc (conn);

	conn.close();

	System.out.println ("*** 終了 ***");
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------

