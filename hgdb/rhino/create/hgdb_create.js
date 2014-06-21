#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//	hgdb_create.js
//
//					Jun/02/2011
// ------------------------------------------------------------------
importPackage (org.hypergraphdb);

importPackage (java.io);
importPackage (java.util);
// ------------------------------------------------------------------
	print ("*** 開始 ***");

	var databaseLocation = "/var/tmp/hgdb/cities_db";

	var ff = new File (databaseLocation);

	var files=ff.listFiles();

	for (var ffx in files)
		{
//		ffx.Delete ();
		}
/*
	for(int it=0; it<files.length; it++)
		{
		files[it].delete ();
		}
*/
//	ff.Delete ();


	var graph = new HyperGraph(databaseLocation);

		row_add_proc (graph,"t4171","大分",39128,"1951-7-29");
		row_add_proc (graph,"t4172","別府",87545,"1951-6-7");
		row_add_proc (graph,"t4173","中津",49287,"1951-9-12");
		row_add_proc (graph,"t4174","日田",86592,"1951-1-29");
		row_add_proc (graph,"t4175","佐伯",93571,"1951-8-8");
		row_add_proc (graph,"t4176","臼杵",32928,"1951-6-15");
		row_add_proc (graph,"t4177","津久見",58926,"1951-8-18");
		row_add_proc (graph,"t4178","竹田",86924,"1951-9-21");
		row_add_proc (graph,"t4179","豊後高田",14971,"1951-4-11");

	print ("*** 終了 ***");

// ------------------------------------------------------------------
function row_add_proc (graph,id,name,population,date_mod)
{
	var unit_aa = {};

	unit_aa['id'] = id;
	unit_aa['name'] = name;
	unit_aa['population'] = population;
	unit_aa['date_mod'] = date_mod;
/*
	dict_unit.put ("id",id);
	dict_unit.put ("name",name);
	dict_unit.put ("population",Integer.toString (population));
	dict_unit.put ("date_mod",date_mod);
*/

	graph.add (unit_aa);
}

// ------------------------------------------------------------------
