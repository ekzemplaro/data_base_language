#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// --------------------------------------------------------------
//	mongo_delete.js
//
//					Sep/10/2015
// --------------------------------------------------------------
importPackage (java.util);
importPackage (com.mongodb);
importPackage (org.bson);


// --------------------------------------------------------------
	print ("*** 開始 ***");

	var	key_in = arguments[0];
	print ("\tkey_in = " + key_in);

	var mm = new MongoClient ("localhost" ,27017);

	var db = mm.getDatabase ("city_db");

	var col_name = "saitama";

	var coll = db.getCollection (col_name);

	print ("\tcoll.count ()  = " + coll.count ());

	coll.deleteMany (new Document("key", key_in))

	print ("\tcoll.count ()  = " + coll.count ());

	print ("*** 終了 ***");

// --------------------------------------------------------------
