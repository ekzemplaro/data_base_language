// ----------------------------------------------------------------
/*
	mongo_delete.cs

					Sep/02/2013

*/
// ----------------------------------------------------------------
using	System;
using	MongoDB;
// ----------------------------------------------------------------
public static class mongo_delete
{

// ----------------------------------------------------------------
public static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string	key_in = args[0];
	Console.WriteLine (key_in);

	String db_name = "city_db";
	String col_name = "saitama";

	Mongo mm = new Mongo();
	mm.Connect();

	IMongoCollection things
		= mm.GetDatabase(db_name).GetCollection (col_name);

	Document doc_del = new Document ();
	doc_del["key"] = key_in;

	things.Remove (doc_del);

	mongo_manipulate.mongo_display_proc (things);

	mm.Disconnect();

	Console.WriteLine ("*** 終了 ***");
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
