// -------------------------------------------------------------------
/*
	csharp/delete/mssql_delete.cs

					Aug/30/2017


*/
// -------------------------------------------------------------------
using	System;
using	System.Data;
using	System.Data.SqlClient;
using	System.Text;

// -------------------------------------------------------------------
class mssql_delete
{
// -------------------------------------------------------------------
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string	id_in = args[0];

	Console.WriteLine (id_in);

	string server_mssql = @"localhost;";

	string str_connect = server_mssql
			+ "uid=sa;"
			+ "pwd=Sql12345;"
			+ "database=city";

	SqlConnection connection = new SqlConnection (str_connect);

	DataTable dtable = table_manipulate.table_prepare_proc ();

	connection.Open ();

	mssql_manipulate.mssql_data_fetch_proc (connection,dtable);

	Console.WriteLine ();

	dtable = mssql_manipulate.row_delete_proc (connection,dtable,id_in);

	connection.Close ();

	Console.WriteLine ("*** 終了 ***");
}

// -------------------------------------------------------------------
}

// -------------------------------------------------------------------
