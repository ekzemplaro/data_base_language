#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// --------------------------------------------------------------
//	update/mongo_update.js
//
//					Sep/10/2015
// --------------------------------------------------------------
importPackage (java.util);
importPackage (com.mongodb);

load ("/var/www/data_base/common/rhino_common/text_manipulate.js");
// --------------------------------------------------------------
	print ("*** 開始 ***");

	var	key_in = arguments[0];
	var	population = arguments[1];
	print ("\tkey_in = " + key_in);
	print ("\tpopulation = " + population);

	var mm = new MongoClient ("localhost" ,27017);

	var db = mm.getDatabase ("city_db");

	var col_name = "saitama";

	var coll = db.getCollection (col_name);
	print ("\tcoll.count ()  = " + coll.count ());

//	mongo_update_proc (coll,key_in,population);
	print ("\tcoll.count ()  = " + coll.count ());

	print ("*** 終了 ***");

// --------------------------------------------------------------
function mongo_update_proc (coll,key_in,population)
{
	print ("*** mongo_update_proc ***");

	var query = new BasicDBObject();
	query.put("key",key_in);

	var cur = coll.find(query);

	print (cur.count ());

	var name_aa = "";
	while(cur.hasNext())
		{
		var obj = cur.next();
		print (obj.get ("key") + "\t");
                print (obj.get ("name") + "\n");

		name_aa = obj.get ("name").toString ();
		}

	var doc = new BasicDBObject();

	doc.put("key",key_in);
	doc.put("name",name_aa);

	doc.put("population",population);
	var str_ddx = get_current_date_proc ();
	doc.put("date_mod",str_ddx);
	coll.update (query,doc);
}


// --------------------------------------------------------------
