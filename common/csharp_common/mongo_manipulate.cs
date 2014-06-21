// ----------------------------------------------------------------
/*
	mongo_manipulate.cs

					Sep/02/2013

*/
// ----------------------------------------------------------------
using	System;
using	MongoDB;
// ----------------------------------------------------------------
public static class mongo_manipulate
{

// ----------------------------------------------------------------
public static void mongo_display_proc (IMongoCollection things)
{
	ICursor cursor = things.FindAll ();

	foreach (Document doc in cursor.Documents)
		{
		Console.Write (doc["key"] + "\t");
		Console.Write (doc["name"] + "\t");
		Console.Write (doc["population"] + "\t");
		Console.WriteLine (doc["date_mod"]);
		}
}

// ----------------------------------------------------------------
public static void mongo_update_proc
	(IMongoCollection things,string key_in,int population_in)
{
	Document doc_new = new Document ();
	doc_new["key"] = key_in;

	String name_aa = "";

	int	count = 0;

	foreach (Document contact in things.Find(doc_new).Documents)
		{
		name_aa = contact["name"].ToString ();
		Console.WriteLine (name_aa);
		count++;
		}

	Console.WriteLine ("count = " + count);

	if (0 < count)
		{
		things.Remove (doc_new);

		doc_new["name"] = name_aa;
		doc_new["population"] = population_in;
		DateTime dateNow = DateTime.Now;
		doc_new["date_mod"] = dateNow.ToString ();
		things.Save (doc_new);
		}

}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
