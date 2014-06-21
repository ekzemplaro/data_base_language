// ----------------------------------------------------------------
/*
	read/mongo_read.cs

					Dec/23/2011

*/
// ----------------------------------------------------------------
using	System;
using	MongoDB;
// ----------------------------------------------------------------
public static class mongo_read
{

// ----------------------------------------------------------------
public static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	String db_name = "city_db";
	String col_name = "saitama";

	Mongo mm = new Mongo();
	mm.Connect(); //Connect to localhost on the default port.

	IMongoCollection things
		= mm.GetDatabase(db_name).GetCollection (col_name);

	mongo_manipulate.mongo_display_proc (things);

	mm.Disconnect();

	Console.WriteLine ("*** 終了 ***");
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
