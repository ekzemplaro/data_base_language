// ----------------------------------------------------------------
/*
	mongo_update.cs

					Sep/02/2013

*/
// ----------------------------------------------------------------
using	System;
using	MongoDB;
// ----------------------------------------------------------------
public static class mongo_update
{

// ----------------------------------------------------------------
public static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string	key_in = args[0];
	int	population_in = int.Parse (args[1]);
	Console.WriteLine (key_in + "\t" + population_in);

	String db_name = "city_db";
	String col_name = "saitama";

	Mongo mm = new Mongo();
	mm.Connect(); //Connect to localhost on the default port.

	IMongoCollection things
		= mm.GetDatabase(db_name).GetCollection (col_name);

	mongo_manipulate.mongo_update_proc (things,key_in,population_in);

	mongo_manipulate.mongo_display_proc (things);

	mm.Disconnect();

	Console.WriteLine ("*** 終了 ***");
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
