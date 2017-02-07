// ----------------------------------------------------------------------
/*
	java/update/mssql_update.java

				Nov/18/2015



*/
// ----------------------------------------------------------------------
import java.util.Date;
import java.sql.Connection;
import java.sql.DriverManager;

// ----------------------------------------------------------------------
public class mssql_update
{

// ----------------------------------------------------------------------
public static void main (String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

	String	id = args[0];
	int	population = Integer.parseInt (args[1]);
	System.out.print ("\tid = " + id);
	System.out.println ("\tpopulation = " + population);

//	String url = "jdbc:sqlserver://host_mssql\\SQLEXPRESS;";
	String url = "jdbc:sqlserver://host_mssql\\EG;";
	url += "databaseName=city;";
	url += "user=sa;password=Tiger123;";

	Connection conn = DriverManager.getConnection (url);

	rdb_common.update_proc	(conn,id,population);

	conn.close ();

	System.out.println ("*** 終了 ***");
}

// ----------------------------------------------------------------------
}
// ----------------------------------------------------------------------
