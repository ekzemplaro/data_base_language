// ----------------------------------------------------------------------
/*
	update/h2_update.java

					Jun/12/2015

*/
// ----------------------------------------------------------------------
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

// ----------------------------------------------------------------------
public class h2_update
{

// ----------------------------------------------------------------------
public static void main (String[] args)
	throws SQLException, ClassNotFoundException,
	InstantiationException, IllegalAccessException
{
	System.out.println ("*** 開始 ***");

	String db_file = args[0];
	System.out.println (db_file);

	String database = "file:" + db_file;

	String	key = args[1];
	int	population = Integer.parseInt (args[2]);
	System.out.print ("\tkey = " + key);
	System.out.println ("\tpopulation = " + population);

	Connection conn =
		DriverManager.getConnection("jdbc:h2:" + database, "SA","");

	Statement ss = conn.createStatement ();

	rdb_common.update_proc	(conn,key,population);

	conn.close ();

	System.out.println ("*** 終了 ***");
}

// ----------------------------------------------------------------------
}
// ----------------------------------------------------------------------
