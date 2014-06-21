// ----------------------------------------------------------------------
/*
	oracle_update.groovy

				May/23/2010


*/
// ----------------------------------------------------------------------
import groovy.sql.Sql
import sql_manipulate


// ----------------------------------------------------------------------
public class oracle_update
{

// ----------------------------------------------------------------------
public static void main (String[] args)
{
	System.out.println ("*** 開始 *** oracle_update ***");

	String	id = args[0];
	int	population = Integer.parseInt (args[1]);
	print ("\tid = " + id);
	println ("\tpopulation = " + population);

	String driver = "oracle.jdbc.driver.OracleDriver"
	String user     = "scott"
	String password = "tiger"

	def protocol = "jdbc:oracl:thin:@spn109:1521/xe"

	def sql = Sql.newInstance (protocol,user,password,driver)


	sql_manipulate.update_proc	(sql,id,population);


	sql.close ();

	System.out.println ("*** 終了 ***");
}

// ----------------------------------------------------------------------
}
// ----------------------------------------------------------------------
