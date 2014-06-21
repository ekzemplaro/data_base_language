#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	hbase_update.py
#					Dec/04/2013
#
# ----------------------------------------------------------------
import	datetime
from time import localtime,strftime
#
import sys
import string
import java.lang

from org.apache.hadoop.hbase import HBaseConfiguration
from org.apache.hadoop.hbase.client import HTable
from org.apache.hadoop.hbase.client import Scan
from org.apache.hadoop.hbase.client import Put
from org.apache.hadoop.hbase.util import Bytes
# ----------------------------------------------------------------
def update_row_proc (table,key_in,population_in):
	print	"update_row_proc"
	print	key_in
	print	population_in
	pp = Put(Bytes.toBytes(key_in))
#	ss_population = Integer.toString (population_in)
	ss_population = "%d" % population_in
	pp.add(Bytes.toBytes("population"), "",Bytes.toBytes(ss_population))
#
	today = strftime ("%Y-%m-%d",localtime ())
	pp.add(Bytes.toBytes("date_mod"), "", Bytes.toBytes(today))
	table.put (pp)
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
id_in = sys.argv[1]
population_in = string.atoi (sys.argv[2])
print ("%s\t%d" % (id_in, population_in))
#
conf = HBaseConfiguration()

table = HTable(conf, "cities")


update_row_proc (table,id_in,population_in)

ss = Scan ()
ss.addColumn ("name","")
ss.addColumn ("population","")
ss.addColumn ("date_mod","")

scanner = table.getScanner(ss)
while 1:
	result = scanner.next()
	if not result:
		break
	key = java.lang.String(result.row)
	print key,"\t",
	uu = result.getValue(Bytes.toBytes("name"),"")
	vv = Bytes.toString(uu)
#	vv = java.lang.String(uu)
	print vv,"\t",
	pp = java.lang.String(result.getValue(Bytes.toBytes("population"),Bytes.toBytes("")))
	print pp,"\t",
	dd = java.lang.String(result.getValue(Bytes.toBytes("date_mod"),""))
	print dd
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
