#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	mcachedb_read.py
#					Jun/01/2015
#
# --------------------------------------------------------
import	sys
import	socket
import	string
sys.path.append ('/var/www/data_base/common/jython_common')
from jython_mcache_manipulate import get_record_proc
# --------------------------------------------------------
print ("*** 開始 ***")

host = 'host_ubuntu1'
port = 21201
print(host)
print(port)
ss = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
ss.connect((host, port))

keys = ["t1521","t1522","t1523","t1524","t1525","t1526",
			"t1527","t1528","t1529",
			"t1530","t1531","t1532"]

for key in keys:
#	print (ss,key)
	get_record_proc (ss,key)

ss.close()

print ("*** 終了 ***")

# --------------------------------------------------------
