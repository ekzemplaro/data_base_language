// -------------------------------------------------------------------
/*
	csharp/update/mssql_update.cs

					Nov/18/2015


*/
// -------------------------------------------------------------------
using	System;
using	System.Data;
using	System.Data.SqlClient;
using	System.Text;

// -------------------------------------------------------------------
class mssql_update
{
// -------------------------------------------------------------------
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string	id_in = args[0];
	int	population_in = int.Parse (args[1]);

	Console.WriteLine (id_in + "\t" + population_in);

	string server_mssql = @"server=host_mssql\EG;";

	string str_connect = server_mssql
			+ "uid=sa;"
			+ "pwd=Tiger123;"
			+ "database=city";

	SqlConnection connection = new SqlConnection (str_connect);

	DataTable dtable = table_manipulate.table_prepare_proc ();

	connection.Open ();

	mssql_manipulate.mssql_data_fetch_proc (connection,dtable);

	Console.WriteLine ();

	mssql_manipulate.mssql_table_update_proc
			(connection,ref dtable,id_in,population_in);

	connection.Close ();

	Console.WriteLine ("*** 終了 ***");
}

// -------------------------------------------------------------------
}

// -------------------------------------------------------------------
