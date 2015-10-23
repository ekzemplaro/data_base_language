// ----------------------------------------------------------------
/*
	/read/postgres_read.cs

					Dec/21/2010

*/
// ----------------------------------------------------------------
using System;
using System.Data;
using Npgsql;

// ----------------------------------------------------------------
public static class postgres_read
{
// ----------------------------------------------------------------
public static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");
	string server="localhost";
	string port="5432";
	string str_db="city";

	string str_connect = "Server=" + server + ";Port=" + port + 
	";User Id=scott;Password=tiger;" +
		"ENCODING=UNICODE;Database=" + str_db + ";";

	string str_com = "select * from cities";

	NpgsqlDataAdapter da_adapter = new NpgsqlDataAdapter
			(str_com,str_connect);

	DataTable dtable = new DataTable ();

	da_adapter.Fill (dtable);

	table_manipulate.display_proc (dtable);

	Console.WriteLine ("*** 終了 ***");
}
// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
