// ----------------------------------------------------------------
/*
	mongo_create.cs

					Sep/02/2013

*/
// ----------------------------------------------------------------
using	System;
using	System.Collections.Generic;

using	MongoDB;
// ----------------------------------------------------------------
public static class mongo_create
{

// ----------------------------------------------------------------
public static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	Dictionary <string,Object> dict_aa = data_prepare_proc ();

	String db_name = "city_db";
	String col_name = "saitama";

	Mongo mm = new Mongo();
	mm.Connect();


	IMongoCollection things
		= mm.GetDatabase(db_name).GetCollection (col_name);

	foreach (KeyValuePair<string, Object> kv in dict_aa)
		{
		Dictionary <string,string> unit_aa
				= (Dictionary <string,string>)kv.Value;

		Document doc_new = new Document ();
		doc_new["key"] = kv.Key;
		things.Remove (doc_new);

		doc_new["name"] = unit_aa["name"];
		doc_new["population"] = unit_aa["population"];
		doc_new["date_mod"] = unit_aa["date_mod"];

		things.Save (doc_new);
		}

	mongo_manipulate.mongo_display_proc (things);

	mm.Disconnect();

	Console.WriteLine ("*** 終了 ***");
}

// ----------------------------------------------------------------
static Dictionary <string,Object> data_prepare_proc ()
{
	Dictionary <string,Object> dict_aa
			= new Dictionary <string,Object> ();

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1161","さいたま",74125,"2009-1-07");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1162","所沢",32587,"2009-2-12");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1163","越谷",28195,"2009-3-28");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1164","久喜",53487,"2009-2-21");

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1165","熊谷",31978,"2009-1-5");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1166","秩父",25647,"2009-5-22");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1167","川越",41786,"2009-7-17");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1168","和光",14235,"2009-3-4");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1169","新座",81324,"2009-10-12");

	return	dict_aa;
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
