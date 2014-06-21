// ---------------------------------------------------------------------
/*
	h2/java/read/h2_read.java

						Sep/26/2012

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

	String database = "file:/var/tmp/h2/cities";

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

