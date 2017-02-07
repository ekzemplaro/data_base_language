// -------------------------------------------------------------------
/*
	postgre_delete.cs

					Jul/16/2011


*/
// -------------------------------------------------------------------
using	System;
using	System.Data;
using	System.Text;
using	Npgsql;

// -------------------------------------------------------------------
class postgre_delete
{
// -------------------------------------------------------------------
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string	id_in = args[0];

	Console.WriteLine (id_in);

	string server="localhost";
	string port="5432";
	string str_db="city";

	string str_connect = "Server=" + server + ";Port=" + port + 
	";User Id=scott;Password=tiger;" +
		"ENCODING=UNICODE;Database=" + str_db + ";";

	postgre_manipulate.data_delete_proc (str_connect,id_in);

	DataTable dtable = table_manipulate.table_prepare_proc ();
	postgre_manipulate.data_fetch_proc (str_connect,dtable);
	table_manipulate.display_proc (dtable);

	Console.WriteLine ("*** 終了 ***");
}

// -------------------------------------------------------------------
}
// -------------------------------------------------------------------
