#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	hbase_delete.py
#					Sep/09/2013
#
# ----------------------------------------------------------------
import sys
import string
import java.lang

from org.apache.hadoop.hbase import HBaseConfiguration
from org.apache.hadoop.hbase.client import HTable
from org.apache.hadoop.hbase.client import Scan
from org.apache.hadoop.hbase.client import Delete
from org.apache.hadoop.hbase.util import Bytes
# ----------------------------------------------------------------
def delete_row_proc (table,key_in):
	print	"delete_row_proc"
	print	key_in
	dd = Delete(Bytes.toBytes(key_in))
	table.delete (dd)
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
id_in = sys.argv[1]
print ("%s" % id_in)
#
conf = HBaseConfiguration()

table = HTable(conf, "cities")

delete_row_proc (table,id_in)

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
	vv = java.lang.String(result.getValue(Bytes.toBytes("name"),""))
	print vv,"\t",
	pp = java.lang.String(result.getValue(Bytes.toBytes("population"),""))
	print pp,"\t",
	dd = java.lang.String(result.getValue(Bytes.toBytes("date_mod"),""))
	print dd
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
