#! /usr/local/bin/coffee
# ---------------------------------------------------------------
#	tcbn_read.coffee
#
#					Sep/14/2011
#
# ---------------------------------------------------------------
fs = require("fs")
sys = require('sys')
TC = require('/var/www/data_base/common/node_common/lib/tokyocabinet')
# ---------------------------------------------------------------
console.log "*** 開始 ***"
#
# ---------------------------------------------------------------
BDB = TC.BDB
bdb = new BDB

file_in = "/var/tmp/tokyo_cabinet/cities.tcb"

success = bdb.open(file_in, BDB.OWRITER | BDB.OCREAT)
if (!success)
	throw bdb.errmsg()

keys =  bdb.range("t0800",true,"t0900",true,100)

for key in keys
	vv = bdb.get(key)
	if (vv == null)
		throw bdb.errmsg()
	unit_aa = JSON.parse(vv)
	out_str = key + "\t"
	out_str += unit_aa['name'] + "\t"
	out_str += unit_aa['population'] + "\t"
	out_str += unit_aa['date_mod']
	sys.puts(out_str)


console.log ("*** 終了 ***")
# ---------------------------------------------------------------

