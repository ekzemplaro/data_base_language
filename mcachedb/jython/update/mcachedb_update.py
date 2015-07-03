#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	mcached_update.py
#					Jun/01/2015
#
# --------------------------------------------------------
import	sys
import	socket
import	string
#
sys.path.append ('/var/www/data_base/common/jython_common')
from jython_mcache_manipulate import mcached_update_proc
# --------------------------------------------------------
print ("*** 開始 ***")

key_in = sys.argv[1]
population_in = int (sys.argv[2])
print ("%s\t%d" % (key_in, population_in))

host = 'host_ubuntu1'
port = 21201
print(host)
print(port)
ss = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
ss.connect((host, port))

mcached_update_proc (ss,key_in,population_in)

ss.close()

print ("*** 終了 ***")

# --------------------------------------------------------
