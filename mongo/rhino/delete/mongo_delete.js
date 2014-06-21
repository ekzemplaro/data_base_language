#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// --------------------------------------------------------------
//	mongo_delete.js
//
//					Sep/02/2013
// --------------------------------------------------------------
importPackage (java.util);
importPackage (com.mongodb);

// --------------------------------------------------------------
	print ("*** 開始 ***");

	var	key_in = arguments[0];
	print ("\tkey_in = " + key_in);

	var mm = new Mongo ("localhost" ,27017);

	var db = mm.getDB ("city_db");

	var col_name = "saitama";

	var coll = db.getCollection (col_name);
	print ("\tcoll.getCount ()  = " + coll.getCount ());

	print(coll.getCount());

	mongo_delete_proc (coll,key_in);

	print ("*** 終了 ***");

// --------------------------------------------------------------
function mongo_delete_proc (coll,key_in)
{
	print ("*** mongo_delete_proc ***");

	var query = new BasicDBObject();
	query.put("key",key_in);

	coll.remove(query);
}

// --------------------------------------------------------------
