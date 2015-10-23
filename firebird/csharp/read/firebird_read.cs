// ----------------------------------------------------------------
/*
	read/firebird_read.cs

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

	string user = "sysdba";
	string passwd = "tiger";
	string dbname = "/var/tmp/firebird/cities.fdb";

        string ConnectionString = "User ID=" + user + ";Password="
		+ passwd + ";Database=" + dbname
		+ ";DataSource=host_firebird;Charset=NONE;";
//		+ ";DataSource=localhost;Charset=NONE;";

	FbConnection conn = new FbConnection(ConnectionString);
	conn.Open(); 

	fbd_manipulate.firebird_display_proc (conn);	

	conn.Close(); 

	Console.WriteLine("*** 終了 ***");
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
