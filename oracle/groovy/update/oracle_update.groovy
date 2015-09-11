// ----------------------------------------------------------------------
/*
	oracle_update.groovy

					Aug/05/2015


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
	System.out.println ("*** 開始 ***")

	String	id = args[0]
	int	population = Integer.parseInt (args[1])
	print ("\tid = " + id)
	println ("\tpopulation = " + population)

	String host = "host_oracle"
	String user     = "scott"
	String password = "tiger"

	def protocol = "jdbc:oracl:thin:@" + host + ":1521/xe"

	def sql = Sql.newInstance (protocol,user,password)

	oracle_update_proc	(sql,id,population)

	sql.close ()

	System.out.println ("*** 終了 ***")
}

// ----------------------------------------------------------------------
static oracle_update_proc (sql,id_in,population_in)
{
	def today = new Date ().format ("dd-MMM-yyyy")

	def sql_str = "update cities set POPULATION = " + population_in +
		",DATE_MOD='" + today +  "'  where ID= '" + id_in + "'"

	sql.executeUpdate (sql_str)
}

// ----------------------------------------------------------------------
}
// ----------------------------------------------------------------------
