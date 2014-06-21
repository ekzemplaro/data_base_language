#! /usr/local/bin/node
// ---------------------------------------------------------------
//	tcbn_update.js
//
//					Jun/16/2011
//
// ---------------------------------------------------------------
var fs = require("fs");
var sys = require('sys');
var TC = require('/var/www/data_base/common/node_common/lib/tokyocabinet');

var text_manipulate=require ("/var/www/data_base/common/node_common/text_manipulate");
// ---------------------------------------------------------------
console.log ("*** 開始 ***");
var id_in=process.argv[2];
var population_in=process.argv[3];

console.log (id_in + "\t" + population_in);

//
// ---------------------------------------------------------------
var BDB = TC.BDB;
var bdb = new BDB;

var file_in = "/var/tmp/tokyo_cabinet/cities.tcb";

var success = bdb.open (file_in, BDB.OWRITER | BDB.OCREAT);
if (!success) throw bdb.errmsg();

	var vv = bdb.get(id_in);
	if (vv === null) throw bdb.errmsg();
	var unit_aa = JSON.parse (vv);
	var out_str = id_in + "\t";
	out_str += unit_aa['name'] + "\t";
	out_str += unit_aa['population'] + "\t";
	out_str += unit_aa['date_mod'];
	sys.puts (out_str);

	unit_aa['population'] = population_in;
	unit_aa['date_mod'] = text_manipulate.get_current_date_proc ();
	var json_out = JSON.stringify (unit_aa);

	console.log (json_out);
	var success = bdb.put (id_in,json_out);
	if (!success) throw bdb.errmsg();

// ---------------------------------------------------------------
console.log ("*** 終了 ***");
// ---------------------------------------------------------------

