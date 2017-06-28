#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	redis_delete.py
#
#					Jun/23/2017
#
import	sys
#
import	redis
#
# ------------------------------------------------------------
sys.stderr.write("*** 開始 ***\n")
#
key_in = sys.argv[1]
print ("%s" % key_in)
#
rr = redis.Redis(host='localhost', port=6379, db=0)
#
str_key = str (key_in)
rr.delete (str_key)
#
sys.stderr.write("*** 終了 ***\n")
#
# ------------------------------------------------------------
