// ---------------------------------------------------------------------
/*
	derby/java/read/derby_read.java

					Oct/01/2012

*/
// ---------------------------------------------------------------------
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Properties;

// ---------------------------------------------------------------------
public class derby_read
{
// ---------------------------------------------------------------------
public static void main (String args [])
	throws SQLException, ClassNotFoundException,
	InstantiationException, IllegalAccessException
{
	System.out.println ("*** 開始 ***");

	String str_connect= "jdbc:derby://localhost:1527/city_aaa;create=true";

	Connection conn = DriverManager.getConnection (str_connect);

	Statement ss = conn.createStatement ();

	rdb_common.display_proc (conn);

	ss.close ();

	conn.close();

	System.out.println ("*** 終了 ***");
}

// ---------------------------------------------------------------------
}

// ---------------------------------------------------------------------
