// -------------------------------------------------------------------
/*
	postgre_update.cs

					Jul/16/2011


*/
// -------------------------------------------------------------------
using	System;
using	System.Data;
using	System.Text;
using	Npgsql;

// -------------------------------------------------------------------
class postgre_update
{
// -------------------------------------------------------------------
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string	id_in = args[0];
	int	population_in = int.Parse (args[1]);

	Console.Write (id_in + "\t");
	Console.WriteLine (population_in);

	string server="localhost";
	string port="5432";
	string str_db="city";

	string str_connect = "Server=" + server + ";Port=" + port + 
	";User Id=scott;Password=tiger;" +
		"ENCODING=UNICODE;Database=" + str_db + ";";

	DataTable dtable = table_manipulate.table_prepare_proc ();

	postgre_manipulate.data_fetch_proc (str_connect,dtable);

	table_manipulate.update_proc (ref dtable,id_in,population_in);

	postgre_manipulate.data_update_proc (str_connect,dtable);

	table_manipulate.display_proc (dtable);

	Console.WriteLine ("*** 終了 ***");
}

// -------------------------------------------------------------------
}

// -------------------------------------------------------------------
