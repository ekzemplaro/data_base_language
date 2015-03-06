#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	update/riak_update.py
#
#					Feb/09/2015
#
# ----------------------------------------------------------------
import sys
#
sys.path.append ('/var/www/data_base/common/python_common')
from riak_manipulate import riak_update_proc
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
key_in = sys.argv[1]
population_in = int (sys.argv[2])
print ("%s\t%d" % (key_in, population_in))
#
url_base = 'http://host_ubuntu1:8098/riak/shimane'
#
riak_update_proc (url_base,key_in,population_in)
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
