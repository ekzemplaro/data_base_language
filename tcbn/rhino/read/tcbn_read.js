#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// -------------------------------------------------------------------
//
//	tcbn_read.js
//
//					May/26/2011
// -------------------------------------------------------------------
importPackage (tokyocabinet);
// importPackage (tokyocabinet.BDB);
importPackage (java.util);

// -------------------------------------------------------------------
	print ("*** 開始 ***");

	var bdb = new BDB();

	var file_in = "/var/tmp/tokyo_cabinet/cities.tcb";
/*
	if(!bdb.open (file_in, BDB.OWRITER | BDB.OCREAT))
		{
		var ecode = bdb.ecode();
		print ("open error: " + bdb.errmsg(ecode));
		}

//	tcbn_manipulate.display_proc (bdb);

	if(!bdb.close())
		{
		var ecode = bdb.ecode();
		print ("close error: " + bdb.errmsg(ecode));
		}
*/
	print ("*** 終了 ***");

// -------------------------------------------------------------------
