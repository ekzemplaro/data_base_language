// ----------------------------------------------------------------
/*
	read/maria_read.cs

					Sep/17/2013

*/
// ----------------------------------------------------------------
using System;
using System.Data;
using MySql.Data.MySqlClient;

// ----------------------------------------------------------------
public static class maria_read
{
public static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string server="localhost";
	string str_db="city";

	string str_connect = "Server=" + server + 
	";User Id=scott;Password=tiger;" +
		"Database=" + str_db + ";";

	MySqlConnection connection = new MySqlConnection (str_connect);
	connection.Open ();

	DataTable dtable = mysql_manipulate.mysql_data_fetch_proc (connection);

	connection.Close ();

	table_manipulate.display_proc (dtable);

	Console.WriteLine("*** 終了 ***");
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
