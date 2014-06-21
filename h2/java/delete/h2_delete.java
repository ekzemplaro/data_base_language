// ----------------------------------------------------------------------
/*
	delete/h2_delete.java

				Sep/26/2012

*/
// ----------------------------------------------------------------------
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

// ----------------------------------------------------------------------
public class h2_delete
{

// ----------------------------------------------------------------------
public static void main (String[] args)
	throws SQLException, ClassNotFoundException,
	InstantiationException, IllegalAccessException
{
	System.out.println ("*** 開始 ***");

	String	id = args[0];
	System.out.println ("\tid = " + id);

	String database = "file:/var/tmp/h2/cities";

	Connection conn =
		DriverManager.getConnection("jdbc:h2:" + database, "SA","");

	Statement ss = conn.createStatement ();

	rdb_common.delete_proc	(conn,id);

	rdb_common.display_proc	(conn);

	conn.close ();

	System.out.println ("*** 終了 ***");
}

// ----------------------------------------------------------------------
}
// ----------------------------------------------------------------------
