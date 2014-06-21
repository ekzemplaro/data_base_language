#! /usr/bin/jython
# -*- coding:utf-8 -*-
#
#	redis_read.py
#
#					Apr/12/2013
#
# --------------------------------------------------------------
import	sys
reload(sys)
sys.setdefaultencoding('utf-8')
import	json
from java.lang import	System
from java.lang import	String

import redis.clients.jedis.Jedis
#
#
# --------------------------------------------------------------
System.out.println (String ("*** 開始 ***","utf-8"))

jedis = redis.clients.jedis.Jedis("host_dbase")

set_keys = jedis.keys("*")

for obj in set_keys:
	key = str (obj)
	str_json = str (jedis.get(key))
	unit_aa = json.loads (str_json)
	print ("%s\t%s\t%d\t%s" %  (key,unit_aa['name'], \
			unit_aa['population'],unit_aa['date_mod']))
#
System.out.println (String ("*** 終了 ***","utf-8"))

# --------------------------------------------------------------
