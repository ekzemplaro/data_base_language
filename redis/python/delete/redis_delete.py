#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	redis_delete.py
#
#					Dec/09/2014
#
import	sys
#
import	redis
#
# ------------------------------------------------------------
print ("*** 開始 ***")
#
key_in = sys.argv[1]
print ("%s" % key_in)
#
rr = redis.Redis(host='host_dbase', port=6379, db=0)
#
str_key = str (key_in)
rr.delete (str_key)
#
print ("*** 終了 ***")
#
# ------------------------------------------------------------
