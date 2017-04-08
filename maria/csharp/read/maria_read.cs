// ----------------------------------------------------------------
/*
	read/maria_read.cs

					Aug/24/2015

*/
// ----------------------------------------------------------------
using System;
using MySql.Data.MySqlClient;

// ----------------------------------------------------------------
public static class maria_read
{
public static void Main (string[] args)
{
	string server = "localhost";
	string str_db = "city";
	string user = "scott";
	string password = "tiger123";
	string str_connect = "Server=" + server + 
	";User Id=" + user + ";Password=" + password + ";Database=" + str_db + ";";

	MySqlConnection conn = new MySqlConnection (str_connect);

	Console.WriteLine ("*** 開始 ***");

	conn.Open();
    

	MySqlCommand command = new MySqlCommand("select * from cities", conn);

	MySqlDataReader dr = command.ExecuteReader();


	while(dr.Read())
		{
		for (int it = 0; it < dr.FieldCount; it++)
			{
			Console.Write("{0} \t", dr[it]);
			}
		Console.WriteLine();
		}

	conn.Close();

	Console.WriteLine ("*** 終了 ***");
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
