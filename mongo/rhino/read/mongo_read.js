#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// --------------------------------------------------------------
//	read/mongo_read.js
//
//					Sep/02/2013
// --------------------------------------------------------------
importPackage(com.mongodb);
// --------------------------------------------------------------
print ("*** 開始 ***");

var mm = new Mongo ("localhost",27017);

var db = mm.getDB ("city_db" );

var col_name = "saitama";
 
var coll = db.getCollection (col_name);

mongo_display_proc (coll);

print ("*** 終了 ***");

// --------------------------------------------------------------
function mongo_display_proc (coll)
{
	print (coll.getCount());

	var cur = coll.find();

	while(cur.hasNext())
		{
		var obj = cur.next();

		var out_str = obj.get ("key") + "\t";
		out_str += obj.get ("name") + "\t";
		out_str += obj.get ("population") + "\t";
		out_str += obj.get ("date_mod");
		print (out_str);
		}
}

// --------------------------------------------------------------
