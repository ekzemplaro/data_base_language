#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	hbase_update.js
//
//						Dec/04/2013
//
// -----------------------------------------------------------------------
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");
load ("/var/www/data_base/common/rhino_common/hbase_manipulate.js");

// -----------------------------------------------------------------------
print ("*** 開始 ***");

var key=arguments[0];
var population_in=arguments[1];
print	("key = " + key + "\tpopulation_in = " + population_in);


var conf = HBaseConfiguration.create();

var factory = new HTableFactory();
var table = factory.createHTableInterface(conf, Bytes.toBytes("cities"));

update_row_proc (table,key,population_in);
get_row_proc (table,key);

print ("*** 終了 ***");
// -----------------------------------------------------------------------
