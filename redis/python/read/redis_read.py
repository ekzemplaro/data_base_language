#! /usr/bin/python
# -*- coding:utf-8 -*-
#
#	redis_read.py
#
#					Sep/07/2011
#
# --------------------------------------------------------------
import sys
import redis
#
sys.path.append ('/var/www/data_base/common/python_common')
from mcache_manipulate import mcache_to_dict_proc
from text_manipulate import dict_display_proc

# --------------------------------------------------------------
print ("*** 開始 ***")

#rr = redis.Redis(host='localhost', port=6379, db=0)
rr = redis.Redis(host='host_dbase', port=6379, db=0)

keys = rr.keys ('t*')

dict_aa = mcache_to_dict_proc (rr,keys)
dict_display_proc (dict_aa)
#
print ("*** 終了 ***")
#
# --------------------------------------------------------------
