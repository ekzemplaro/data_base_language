// -------------------------------------------------------------------
/*
	update/mysql_update.cs

					Sep/17/2013


*/
// -------------------------------------------------------------------
using	System;
using	System.Data;
using	System.Text;
using	MySql.Data.MySqlClient;

// -------------------------------------------------------------------
class mysql_update
{
// -------------------------------------------------------------------
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string	id_in = args[0];
	int	population_in = int.Parse (args[1]);

	string server="host_mysql";
	string str_db="city";

	string str_connect = "Server=" + server +
	";User Id=scott;Password=tiger;" + "Database=" + str_db + ";";
 
	MySqlConnection connection = new MySqlConnection (str_connect);
	connection.Open ();

	mysql_manipulate.mysql_update_proc (connection,id_in,population_in);

	connection.Close ();

	Console.WriteLine ("*** 終了 ***");
}

// -------------------------------------------------------------------
}

// -------------------------------------------------------------------
