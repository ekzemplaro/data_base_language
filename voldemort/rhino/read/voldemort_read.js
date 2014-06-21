#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// --------------------------------------------------------------
//
//	voldemort_read.js
//
//					Sep/09/2013
//
// --------------------------------------------------------------
importPackage (voldemort.client);
//importPackage(voldemort.client);
//importPackage(voldemort.versioning);

importPackage(java.util);
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");
// load ("/var/www/data_base/common/rhino_common/voldemort_manipulate.js");
// --------------------------------------------------------------
print ("*** 開始 ***");

var storeName    = "cities";

var bootstrapUrl = "tcp://localhost:6666";
var factory = new SocketStoreClientFactory
		(new ClientConfig().setBootstrapUrls(bootstrapUrl));

/*
var client = factory.getStoreClient (storeName);

var dict_aa = voldemort_manipulate.voldemort_to_dict_proc (client);

text_manipulate.dict_display_proc (dict_aa);
*/
print ("*** 終了 ***");
// --------------------------------------------------------------
