#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// --------------------------------------------------------------
//	mongo_create.js
//
//					Jun/04/2014
// --------------------------------------------------------------
importPackage (java.util);

importPackage (com.mongodb);
// importPackage (com.mongodb.DBCollection);
// importPackage (com.mongodb.BasicDBObject);

load ("/var/www/data_base/common/rhino_common/text_manipulate.js");
// --------------------------------------------------------------
print ("*** 開始 ***");

var dict_aa = data_prepare_proc ();

var mm = new Mongo ("localhost" ,27017);
var db = mm.getDB ("city_db");
var col_name = "saitama";
var coll = db.getCollection (col_name);

coll.drop ();

for (var key in dict_aa)
	{
print ("key = " + key);
	mongo_create_proc (coll,key,dict_aa[key]["name"],dict_aa[key]["population"],dict_aa[key]["date_mod"]);
	}

//	mongo_manipulate.mongo_display_proc (coll);

print ("*** 終了 ***");

// --------------------------------------------------------------
function mongo_create_proc (coll,key_in,name_in,population_in,date_mod_in)
{
	var doc = new BasicDBObject();

	doc.put("key",key_in);
	doc.put("name",name_in);
	doc.put("population",population_in);
	doc.put("date_mod",date_mod_in);

	coll.insert (doc);
}


// --------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ();

	dict_aa = dict_append_proc (dict_aa,'t1161','さいたま',81329,'1951-2-24');
	dict_aa = dict_append_proc (dict_aa,'t1162','所沢',35782,'1951-7-15');
	dict_aa = dict_append_proc (dict_aa,'t1163','越谷',52649,'1951-5-2');
	dict_aa = dict_append_proc (dict_aa,'t1164','久喜',38127,'1951-6-22');
	dict_aa = dict_append_proc (dict_aa,'t1165','熊谷',43852,'1951-8-14');
	dict_aa = dict_append_proc (dict_aa,'t1166','秩父',61574,'1951-10-12');
	dict_aa = dict_append_proc (dict_aa,'t1167','川越',37981,'1951-3-21');
	dict_aa = dict_append_proc (dict_aa,'t1168','和光',52416,'1951-7-26');
	dict_aa = dict_append_proc (dict_aa,'t1169','新座',74857,'1951-11-8');

	return	dict_aa;
}

// --------------------------------------------------------------
