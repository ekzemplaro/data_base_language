// -------------------------------------------------------------------
/*
	delete/maria_delete.cs

					Sep/17/2013


*/
// -------------------------------------------------------------------
using	System;
using	System.Data;
using	System.Text;
using	MySql.Data.MySqlClient;

// -------------------------------------------------------------------
class maria_delete
{
// -------------------------------------------------------------------
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string	id_in = args[0];

	string server="localhost";
	string str_db="city";

	string str_connect = "Server=" + server +
	";User Id=scott;Password=tiger;" +
		"Database=" + str_db + ";";
 
	MySqlConnection connection = new MySqlConnection (str_connect);
	connection.Open ();

	mysql_manipulate.mysql_delete_proc (connection,id_in);

	connection.Close ();

	Console.WriteLine ("*** 終了 ***");
}

// -------------------------------------------------------------------
}

// -------------------------------------------------------------------
