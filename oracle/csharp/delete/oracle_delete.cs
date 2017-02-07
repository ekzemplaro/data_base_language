// -------------------------------------------------------------------
/*
	oracle_delete.cs

					May/23/2011

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

	Console.WriteLine (id_in);

	string str_connect =
		"User Id=scott;Password=tiger;Data Source=spn109:1521/xe";
//		"User Id=scott;Password=tiger;Data Source=cpt003:1521/orcl";

	OracleConnection connection = new OracleConnection (str_connect);

	connection.Open ();
 
	DataTable dtable = oracle_manipulate.oracle_data_fetch_proc (connection);

	Console.WriteLine ();

	dtable = oracle_manipulate.row_delete_proc (connection,dtable,id_in);

	table_manipulate.display_proc (dtable);

	connection.Close ();

	Console.WriteLine ("*** 終了 ***");
}

// -------------------------------------------------------------------
}

// -------------------------------------------------------------------
