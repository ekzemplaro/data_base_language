// ----------------------------------------------------------------------
/*
	java/update/sqlite3_update.java

				May/26/2011

*/
// ----------------------------------------------------------------------
import java.util.Date;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

// ----------------------------------------------------------------------
public class sqlite3_update
{

// ----------------------------------------------------------------------
public static void main (String[] args) throws Exception
{
	Class.forName ("org.sqlite.JDBC");

	System.out.println ("*** 開始 *** sqlite3_update ***");

	String file_name = args[0];

	String	id = args[1];
	int	population = Integer.parseInt (args[2]);
	System.out.print ("\tid = " + id);
	System.out.println ("\tpopulation = " + population);

	Connection conn = DriverManager.getConnection
		("jdbc:sqlite:" + file_name);

	System.out.println ("");

	rdb_common.update_proc	(conn,id,population);

	rdb_common.display_proc	(conn);

	conn.close ();

	System.out.println ("*** 終了 ***");
}

// ----------------------------------------------------------------------
}
// ----------------------------------------------------------------------
