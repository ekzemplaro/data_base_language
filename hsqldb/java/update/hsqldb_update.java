// ----------------------------------------------------------------------
/*
	java/update/hsqldb_update.java

					May/30/2011

*/
// ----------------------------------------------------------------------
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

// ----------------------------------------------------------------------
public class hsqldb_update
{

// ----------------------------------------------------------------------
public static void main (String[] args)
	throws SQLException, ClassNotFoundException,
	InstantiationException, IllegalAccessException
{
	System.out.println ("*** 開始 ***");

	String	id = args[0];
	int	population = Integer.parseInt (args[1]);
	System.out.print ("\tid = " + id);
	System.out.println ("\tpopulation = " + population);

	String driver = "org.hsqldb.jdbcDriver";

	Class.forName (driver).newInstance ();

	String database = "file:/var/tmp/hsqldb/cities;shutdown=true";


	Connection conn =
		DriverManager.getConnection("jdbc:hsqldb:" + database, "SA","");

	Statement ss = conn.createStatement ();

	rdb_common.update_proc	(conn,id,population);


	rdb_common.display_proc	(conn);

	conn.close ();

	System.out.println ("*** 終了 ***");
}

// ----------------------------------------------------------------------
}
// ----------------------------------------------------------------------
