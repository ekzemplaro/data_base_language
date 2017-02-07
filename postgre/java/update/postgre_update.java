// ----------------------------------------------------------------------
/*
	java/update/postgre_update.java

				May/26/2011

*/
// ----------------------------------------------------------------------
import java.util.Date;
import java.sql.Connection;
import java.sql.DriverManager;

// ----------------------------------------------------------------------
public class postgre_update
{

// ----------------------------------------------------------------------
public static void main (String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

	String	id = args[0];
	int	population = Integer.parseInt (args[1]);
	System.out.print ("\tid = " + id);
	System.out.println ("\tpopulation = " + population);

	Connection conn = DriverManager.getConnection
			("jdbc:postgresql://localhost/city","scott","tiger");

	rdb_common.update_proc	(conn,id,population);

	rdb_common.display_proc	(conn);

	conn.close ();

	System.out.println ("*** 終了 ***");
}

// ----------------------------------------------------------------------
}
// ----------------------------------------------------------------------
