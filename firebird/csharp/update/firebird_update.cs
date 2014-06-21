// ----------------------------------------------------------------
/*
	firebird_update.cs

					Oct/25/2011

*/
// ----------------------------------------------------------------
using	System;

using	FirebirdSql.Data.FirebirdClient;

// ----------------------------------------------------------------
public static class firebird_read
{
// ----------------------------------------------------------------
public static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string	id_in = args[0];
	int	population_in = int.Parse (args[1]);

	Console.Write (id_in + "\t");
	Console.WriteLine (population_in);

	string user = "sysdba";
	string passwd = "tiger";
	string dbname = "/var/tmp/firebird/cities.fdb";

        string ConnectionString = "User ID=" + user + ";Password="
		+ passwd + ";Database=" + dbname
		+ ";DataSource=localhost;Charset=NONE;";

	FbConnection conn = new FbConnection(ConnectionString);
	conn.Open(); 

	fbd_manipulate.update_proc (conn,id_in,population_in);

	conn.Close ();

	Console.WriteLine("*** 終了 ***");
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
