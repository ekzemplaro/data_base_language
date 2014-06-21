// ----------------------------------------------------------------------
/*
	java/update/firebird_update.java

				Jun/01/2011


*/
// ----------------------------------------------------------------------
import java.sql.DriverManager;
import java.sql.Connection;
import java.util.Date;

// ----------------------------------------------------------------------
public class firebird_update
{

// ----------------------------------------------------------------------
public static void main (String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

	String	id = args[0];
	int	population = Integer.parseInt (args[1]);
	System.out.print ("\tid = " + id);
	System.out.println ("\tpopulation = " + population);

	DriverManager.registerDriver(new org.firebirdsql.jdbc.FBDriver());

	String user     = "sysdba";
	String password = "tiger";
	String database = "/var/tmp/firebird/cities.fdb";

	Connection conn =
	DriverManager.getConnection("jdbc:firebirdsql:localhost/3050:" +
	database, user, password);

	System.out.println ("connected.");

	rdb_common.update_proc	(conn,id,population);

	rdb_common.display_proc	(conn);

	conn.close ();

	System.out.println ("*** 終了 ***");
}

// ----------------------------------------------------------------------
}
// ----------------------------------------------------------------------
