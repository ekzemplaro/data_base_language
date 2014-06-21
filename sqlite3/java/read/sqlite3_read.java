// ----------------------------------------------------------------------
/*
	sqlite3_read.java

				Jan/24/2011

	java  -classpath ".:sqlite-jdbc-3.6.17.1.jar" sqlite3_read

*/
// ----------------------------------------------------------------------
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

// ----------------------------------------------------------------------
public class sqlite3_read
{

// ----------------------------------------------------------------------
public static void main (String[] args) throws Exception
{
	Class.forName("org.sqlite.JDBC");

	System.out.println ("*** 開始 *** sqlite3_java ***");

	String sqlite3_file = args[0];

	String str_connect = "jdbc:sqlite:" + sqlite3_file;

	System.out.println ("\tstr_connect = " + str_connect);

	Connection conn = DriverManager.getConnection (str_connect);

	rdb_common.display_proc (conn);

	conn.close ();

	System.out.println ("*** 終了 ***");
}

// ----------------------------------------------------------------------
}
// ----------------------------------------------------------------------
