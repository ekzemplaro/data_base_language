/* ---------------------------------------------------------------------- */
/*
	java/update/oracle_update.java

				Sep/28/2010


*/
/* ---------------------------------------------------------------------- */
import java.sql.Connection;
import java.sql.DriverManager;

/* ---------------------------------------------------------------------- */
public class oracle_update
{

/* ---------------------------------------------------------------------- */
public static void main (String[] args) throws Exception
{
	Class.forName ("oracle.jdbc.driver.OracleDriver");

	System.out.println ("*** 開始 *** oracle_update ***");

	String	id = args[0];
	int	population = Integer.parseInt (args[1]);
	System.out.print ("\tid = " + id);
	System.out.println ("\tpopulation = " + population);

	Connection conn =
		DriverManager.getConnection
			("jdbc:oracl:thin:@spn109:1521:xe","scott","tiger");

	rdb_common.update_proc	(conn,id,population);

	rdb_common.display_proc	(conn);

	conn.close ();

	System.out.println ("*** 終了 ***");
}

/* ---------------------------------------------------------------------- */
}
/* ---------------------------------------------------------------------- */
