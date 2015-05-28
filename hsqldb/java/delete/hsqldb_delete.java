// ----------------------------------------------------------------------
/*
	java/delete/hsqldb_delete.java

					May/26/2015

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

	String	id = args[0];
	System.out.println ("\tid = " + id);

	String driver = "org.hsqldb.jdbcDriver";

	Class.forName (driver).newInstance ();

	String database = "file:/var/tmp/hsqldb/cities;shutdown=true";


	Connection conn =
		DriverManager.getConnection("jdbc:hsqldb:" + database, "SA","");

	Statement ss = conn.createStatement ();

	rdb_common.delete_proc	(conn,id);

	conn.close ();

	System.out.println ("*** 終了 ***");
}

// ----------------------------------------------------------------------
}
// ----------------------------------------------------------------------
