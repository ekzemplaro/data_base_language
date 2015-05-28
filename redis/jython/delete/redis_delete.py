#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	redis_delete.py
#
#					May/28/2015
#
import	sys
# reload(sys)
# sys.setdefaultencoding('utf-8')
#
#
import redis.clients.jedis.Jedis
#
# ------------------------------------------------------------
print ("*** 開始 ***")
#
key_in = sys.argv[1]
print ("%s" % key_in)
#
jedis = redis.clients.jedis.Jedis("host_dbase")
#
jedis.del (key_in)
#
#
print ("*** 終了 ***")
#
# ------------------------------------------------------------
