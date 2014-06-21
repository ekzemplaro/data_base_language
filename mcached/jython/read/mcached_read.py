#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	mcached_read.py
#					Apr/15/2013
#
# --------------------------------------------------------
import	sys
import	socket
import	string
import	json
sys.path.append ('/var/www/data_base/common/jython_common')
from jython_mcache_manipulate import get_record_proc
# --------------------------------------------------------
print ("*** 開始 ***")


host = 'localhost'
port = 11211
print(host)
print(port)
ss = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
addr = (host,port)
ss.connect (addr)

keys = ["t1731","t1732","t1733","t1734","t1735","t1736",
			"t1737","t1738","t1739"]
for key in keys:
	get_record_proc (ss,key)
#
ss.close()

print ("*** 終了 ***")

# --------------------------------------------------------
