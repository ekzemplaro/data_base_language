// ----------------------------------------------------------------------
/*
	java/update/derby_update.java

					Oct/01/2012

*/
// ----------------------------------------------------------------------
import java.util.Date;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Properties;

// ----------------------------------------------------------------------
public class derby_update
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

	String str_connect= "jdbc:derby://localhost:1527/city_aaa;create=true";
	Connection conn = DriverManager.getConnection (str_connect);

	System.out.println ("*** connected. ***");

	rdb_common.update_proc	(conn,id,population);

	rdb_common.display_proc	(conn);

	conn.close ();

	System.out.println ("*** 終了 ***");
}

// ----------------------------------------------------------------------
}
// ----------------------------------------------------------------------
