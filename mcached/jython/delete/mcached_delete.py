#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	mcached_delete.py
#					Apr/15/2013
#
# --------------------------------------------------------
import	sys
import	socket
#
sys.path.append ('/var/www/data_base/common/jython_common')
from jython_mcache_manipulate import delete_record_proc
# --------------------------------------------------------
print ("*** 開始 ***")

key = sys.argv[1]
print ("%s" % key)

host = 'localhost'
port = 11211
print(host)
print(port)
addr = (host,port)
ss = socket.socket (socket.AF_INET, socket.SOCK_STREAM)
ss.connect (addr)

delete_record_proc (ss,key)

ss.close()

print ("*** 終了 ***")

# --------------------------------------------------------
