#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	read/neo4j_read.py
#
#					Oct/11/2011
#
import	sys
import	httplib
from java.lang import	System
from java.lang import	String
# ----------------------------------------------------------------
sys.path.append ('/var/www/data_base/common/jython_common')
#
from com.xhaus.jyson import JysonCodec
#
# ----------------------------------------------------------------
def row_parser (key):
	place= "/db/data/node/%d/properties" % key
	conn = httplib.HTTPConnection ("localhost:7474")
	conn.request ("GET",place)
	r1 = conn.getresponse ()
#	print r1.status, r1.reason
	json_str = r1.read ()
	conn.close ()
#
#	print (json_str)
	data_bb = JysonCodec.loads (json_str)
	System.out.print	(data_bb['id'])
	System.out.print	('\t')
	System.out.print	(String (data_bb['name'],"utf-8"))
	System.out.print	('\t')
	System.out.print	(data_bb['population'])
	System.out.print	('\t')
	System.out.println	(String (data_bb['date_mod'],"utf-8"))
#
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
for key in range (2,11):
	row_parser (key)
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
