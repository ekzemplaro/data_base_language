#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	tyrant_delete.py
#					Jul/10/2011
#
# --------------------------------------------------------
import	sys
import	socket
import	string
sys.path.append ('/var/www/data_base/common/jython_common')
from jython_mcache_manipulate import delete_record_proc
# --------------------------------------------------------
print ("*** 開始 ***")

key = sys.argv[1]
print ("%s" % key)

host = 'localhost'
port = 1978
print(host)
print(port)
ss = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
ss.connect((host, port))

delete_record_proc (ss,key)

ss.close()

print ("*** 終了 ***")

# --------------------------------------------------------
