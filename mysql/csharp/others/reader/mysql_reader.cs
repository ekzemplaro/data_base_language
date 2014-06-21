/* ---------------------------------------------------------------- */
/*
	reader/mysql_reader.cs

					Mar/26/2010

*/
/* ---------------------------------------------------------------- */
using System;
using System.Data;
using MySql.Data.MySqlClient;

/* ---------------------------------------------------------------- */
public static class mysql_reader
{
public static void Main (string[] args)
{
//	string server="cdbd026";
//	string server="cpt003";
	string server="localhost";

	string str_connect = "Server=" + server + 
	";User Id=uchida;Password=hello9;Database=city;";

	MySqlConnection conn = new MySqlConnection (str_connect);

Console.WriteLine("*** start ***");

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

Console.WriteLine("*** end ***");
}
/* ---------------------------------------------------------------- */
}
/* ---------------------------------------------------------------- */
