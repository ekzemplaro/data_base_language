// -------------------------------------------------------------------
/*
	c_sharp/update/oracle_update.cs

					May/23/2011

	csc oracle_command.cs -r:System.Data -r:System.Data.OracleClient


	to_date ('2009/7/23 16:20:15','YYYY/MM/DD HH24:MI:SS')
*/
// -------------------------------------------------------------------
using	System;
using	System.Data;
using	System.Data.OracleClient;
using	System.Text;

// -------------------------------------------------------------------
class oracle_update
{
// -------------------------------------------------------------------
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string	id_in = args[0];
	int	population_in = int.Parse (args[1]);

	Console.WriteLine (id_in + "\t" + population_in);

	string str_connect =
		"User Id=scott;Password=tiger;Data Source=spn109:1521/xe";
//		"User Id=scott;Password=tiger;Data Source=cpt003:1521/orcl";

	OracleConnection connection = new OracleConnection (str_connect);

	Console.WriteLine ("*** pppp ***");
	connection.Open ();
	Console.WriteLine ("*** qqqq ***");
 
	DataTable dtable = oracle_manipulate.oracle_data_fetch_proc
		(connection);

	Console.WriteLine ("*** rrrr ***");

	Console.WriteLine ();

	oracle_manipulate.oracle_table_modify_proc (connection,ref dtable,id_in,population_in);
	Console.WriteLine ("*** ssss ***");

	connection.Close ();

	table_manipulate.display_proc (dtable);

	Console.WriteLine ("*** 終了 ***");
}

// -------------------------------------------------------------------
}

// -------------------------------------------------------------------
