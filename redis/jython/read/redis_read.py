#! /usr/bin/jython
# -*- coding:utf-8 -*-
#
#	redis_read.py
#
#					May/28/2015
#
# --------------------------------------------------------------
import	sys
import	json
from java.lang import	System
from java.lang import	String

import redis.clients.jedis.Jedis
#
# --------------------------------------------------------------
System.out.println (String ("*** 開始 ***","utf-8"))

jedis = redis.clients.jedis.Jedis("host_dbase")

set_keys = jedis.keys("*")

for obj in sorted (set_keys):
	key = str (obj)
	str_json = str (jedis.get(key))
	unit_aa = json.loads (str_json)
	print ("%s\t%s\t%d\t%s" %  (key,unit_aa['name'], \
			unit_aa['population'],unit_aa['date_mod']))
#
System.out.println (String ("*** 終了 ***","utf-8"))

# --------------------------------------------------------------
