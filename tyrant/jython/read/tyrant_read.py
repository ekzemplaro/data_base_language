#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	tyrant_read.py
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
port = 1978
print(host)
print(port)
ss = socket.socket (socket.AF_INET,socket.SOCK_STREAM)
addr = (host,port)
ss.connect (addr)

keys = ["t4761","t4762","t4763","t4764","t4765","t4766",
			"t4767","t4768","t4769"]
for key in keys:
	get_record_proc (ss,key)
#
ss.close()

print ("*** 終了 ***")

# --------------------------------------------------------
