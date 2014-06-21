/* ---------------------------------------------------------------- */
/*
	reader/postgre_reader.cs

					Apr/21/2010

*/
/* ---------------------------------------------------------------- */
using System;
using System.Data;
using Npgsql;

/* ---------------------------------------------------------------- */
public static class postgres_reader
{
public static void Main (string[] args)
{
//	string server="cdbd026";
//	string server="cpt003";
	string server="localhost";
	string port="5432";

	string str_connect = "Server=" + server + ";Port=" + port + 
	";User Id=uchida;Password=hello9;ENCODING=UNICODE;Database=city;";

	NpgsqlConnection conn = new NpgsqlConnection (str_connect);

Console.WriteLine("*** start ***");
	conn.Open();
    
	NpgsqlCommand command = new NpgsqlCommand("select * from cities", conn);

	NpgsqlDataReader dr = command.ExecuteReader();

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
