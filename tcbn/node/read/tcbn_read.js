#! /usr/local/bin/node
// ---------------------------------------------------------------
//	tcbn_read.js
//
//					Jun/16/2011
//
// ---------------------------------------------------------------
var fs = require("fs");
var sys = require('sys');
var TC = require('/var/www/data_base/common/node_common/lib/tokyocabinet');
// ---------------------------------------------------------------
console.log ("*** 開始 ***");
//
// ---------------------------------------------------------------
var BDB = TC.BDB;
var bdb = new BDB;

var file_in = "/var/tmp/tokyo_cabinet/cities.tcb";

var success = bdb.open (file_in, BDB.OWRITER | BDB.OCREAT);
if (!success) throw bdb.errmsg();

var keys =  bdb.range ("t0800",true,"t0900",true,100);

for (var it in keys)
	{
//	sys.puts (keys[it])
	var vv = bdb.get(keys[it]);
	if (vv === null) throw bdb.errmsg();
	var unit_aa = JSON.parse (vv);
	var out_str = keys[it] + "\t";
	out_str += unit_aa['name'] + "\t";
	out_str += unit_aa['population'] + "\t";
	out_str += unit_aa['date_mod'];
	sys.puts (out_str);
	}


// ---------------------------------------------------------------
console.log ("*** 終了 ***");
// ---------------------------------------------------------------

