// -------------------------------------------------------------------
/*
	update/maria_update.cs

					Apr/08/2017


*/
// -------------------------------------------------------------------
using	System;
using	MySql.Data.MySqlClient;

// -------------------------------------------------------------------
class maria_update
{
// -------------------------------------------------------------------
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string	id_in = args[0];
	int	population_in = int.Parse (args[1]);

	string server = "localhost";
	string str_db = "city";
	string user = "scott";
	string password = "tiger123";

	string str_connect = "Server=" + server + 
		";User Id=" + user + ";Password=" + password +
		";Database=" + str_db + ";";
 
	MySqlConnection connection = new MySqlConnection (str_connect);
	connection.Open ();

	mysql_manipulate.mysql_update_proc (connection,id_in,population_in);

	connection.Close ();


	Console.WriteLine ("*** 終了 ***");
}

// -------------------------------------------------------------------
}

// -------------------------------------------------------------------
