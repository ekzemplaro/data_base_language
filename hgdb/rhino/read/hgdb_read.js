#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// -------------------------------------------------------------- 
//
//	hgdb_read.java
//
//						Jun/16/2011
//
// --------------------------------------------------------------
importPackage (org.hypergraphdb);
importPackage (org.hypergraphdb.query);

importPackage (java.util);
// --------------------------------------------------------------

	print ("*** 開始 ***");

	var databaseLocation = "/var/tmp/hgdb/cities_db";

	var graph = new HyperGraph(databaseLocation);

//	var condition = new AtomTypeCondition(HashMap.class);
//	var condition = new AtomTypeCondition(HashMap);
	var condition = new AtomTypeCondition(HashMap);

	var rs = graph.find(condition);

	while (rs.hasNext())
		{
		var current = rs.next();
		var result = graph.get(current);

		print (result.get ("id") + "\t");
		print (result.get ("name") + "\t");
		var ppx = result.get ("population");
		print (ppx + "\t");

		print (result.get ("date_mod"));
		}
	graph.close();
	print ("*** 終了 ***");

// --------------------------------------------------------------
