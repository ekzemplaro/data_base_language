// --------------------------------------------------------------
//	mongo_create.java
//
//					Sep/11/2015
// --------------------------------------------------------------
import	java.util.HashMap;
import	java.util.Set;
import	java.util.TreeSet;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.MongoCollection;

import org.bson.Document;

// --------------------------------------------------------------
public class mongo_create
{

// --------------------------------------------------------------
public static void main (String[] args)
{
	System.out.println ("*** 開始 ***");

	HashMap <String, HashMap <String,String>>
		dict_aa = data_prepare_proc ();
	try
	{
	MongoClient client = new MongoClient ("localhost",27017);

	MongoDatabase db = client.getDatabase ("city_db");

	String col_name = "saitama";

	MongoCollection coll = db.getCollection (col_name);

	coll.drop ();

	Set <String> set_aaa = dict_aa.keySet ();

	Set <String> ss = new TreeSet <String> (set_aaa);

	for (Object key_aa: ss)
		{
		String key = (String)key_aa;

		HashMap <String,String> dict_unit
			= dict_aa.get (key_aa);
		String ppx = dict_unit.get ("population");
		int ppx_i = Integer.parseInt (ppx);
		mongo_create_proc (coll,key,dict_unit.get ("name"),
			ppx_i,dict_unit.get ("date_mod"));
		}

	client.close ();
	}
	catch (Exception ee)
	{
	ee.printStackTrace ();
	}

	System.out.println ("*** 終了 ***");
}

// --------------------------------------------------------------
static HashMap <String, HashMap <String,String>>
data_prepare_proc ()
{
	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1161","さいたま",51276,"2008-5-9");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1162","所沢",72849,"2008-3-11");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1163","越谷",94253,"2008-7-24");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1164","久喜",87324,"2008-12-14");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1165","熊谷",76531,"2008-8-12");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1166","秩父",28439,"2008-7-28");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1167","川越",31457,"2008-6-19");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1168","和光",47365,"2008-11-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1169","新座",56824,"2008-10-24");

	return	dict_aa;
}
// --------------------------------------------------------------
public static void mongo_create_proc
	(MongoCollection coll,String key_in,String name_in,
	int population_in,String date_mod_in)
{
	Document doc = new Document("key",key_in)
		.append ("name",name_in)
		.append ("population",population_in)
		.append ("date_mod",date_mod_in);

	coll.insertOne (doc);
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
