#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	hbase_read.py
#					Sep/09/2013
#
# ----------------------------------------------------------------
import	sys
reload(sys)
sys.setdefaultencoding('utf-8')
import java.lang

from org.apache.hadoop.hbase import HBaseConfiguration
from org.apache.hadoop.hbase.client import HTable
from org.apache.hadoop.hbase.client import Scan
from org.apache.hadoop.hbase.util import Bytes
# ----------------------------------------------------------------
print ("*** 開始 ***")

conf = HBaseConfiguration ()

table = HTable (conf,"cities")

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
	vv = java.lang.String(result.getValue(Bytes.toBytes("name"),Bytes.toBytes("")))
	print vv,"\t",
	pp = java.lang.String(result.getValue(Bytes.toBytes("population"),""))
	print pp,"\t",
	dd = java.lang.String(result.getValue(Bytes.toBytes("date_mod"),""))
	print dd
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
