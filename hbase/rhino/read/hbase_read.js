#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	hbase_read.js
//
//						Dec/04/2013
//
// -----------------------------------------------------------------------
load ("/var/www/data_base/common/rhino_common/hbase_manipulate.js");

// -----------------------------------------------------------------------
print ("*** 開始 ***");

var keys = ["t1671","t1672","t1673","t1674","t1675",
		"t1676","t1677","t1678","t1679"];

var conf = HBaseConfiguration.create();

var factory = new HTableFactory();
var table = factory.createHTableInterface(conf, Bytes.toBytes("cities"));

for (var it in keys)
	{
	var key = keys[it];
	get_row_proc (table,key);
	}

print ("*** 終了 ***");
// -----------------------------------------------------------------------
