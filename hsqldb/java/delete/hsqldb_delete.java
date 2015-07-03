// ----------------------------------------------------------------------
/*
	java/delete/hsqldb_delete.java

					Jun/12/2015

*/
// ----------------------------------------------------------------------
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

// ----------------------------------------------------------------------
public class hsqldb_delete
{

// ----------------------------------------------------------------------
public static void main (String[] args)
	throws SQLException, ClassNotFoundException,
	InstantiationException, IllegalAccessException
{
	System.out.println ("*** 開始 ***");

	String db_file = args[0];
	System.out.println (db_file);
	String database = "file:" + db_file + ";shutdown=true";

	String	key = args[1];
	System.out.println ("\tkey = " + key);

	String driver = "org.hsqldb.jdbcDriver";

	Class.forName (driver).newInstance ();

	Connection conn =
		DriverManager.getConnection("jdbc:hsqldb:" + database, "SA","");

	Statement ss = conn.createStatement ();

	rdb_common.delete_proc	(conn,key);

	conn.close ();

	System.out.println ("*** 終了 ***");
}

// ----------------------------------------------------------------------
}
// ----------------------------------------------------------------------
