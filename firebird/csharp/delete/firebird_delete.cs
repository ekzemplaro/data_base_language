// ----------------------------------------------------------------
/*
	firebird_delete.cs

					Aug/25/2015

*/
// ----------------------------------------------------------------
using	System;

using	FirebirdSql.Data.FirebirdClient;

// ----------------------------------------------------------------
public static class firebird_read
{
public static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string	key_in = args[0];

	Console.WriteLine (key_in);

	string user = "sysdba";
	string passwd = "tiger";
	string dbname = "/var/tmp/firebird/cities.fdb";

        string ConnectionString = "User ID=" + user + ";Password="
		+ passwd + ";Database=" + dbname
		+ ";DataSource=host_firebird;Charset=NONE;";
//		+ ";DataSource=localhost;Charset=NONE;";

	FbConnection conn = new FbConnection(ConnectionString);
	conn.Open(); 

	fbd_manipulate.delete_proc (conn,key_in);

	conn.Close(); 

	Console.WriteLine("*** 終了 ***");
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
