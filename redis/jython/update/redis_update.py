#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	redis_update.py
#
#					Apr/12/2013
#
import	sys
reload(sys)
sys.setdefaultencoding('utf-8')
import	string
import	json
#
import redis.clients.jedis.Jedis
#
from time import localtime,strftime
# ------------------------------------------------------------
print ("*** 開始 ***")
#
key_in = sys.argv[1]
population_in = string.atoi (sys.argv[2])
print ("%s\t%d" % (key_in, population_in))
#
jedis = redis.clients.jedis.Jedis("host_dbase")
#
str_json = str (jedis.get(key_in))
print (str_json)
#
unit_aa = json.loads (str_json)
print ("%s\t%s\t%d\t%s" %  (key_in,unit_aa['name'], \
		unit_aa['population'],unit_aa['date_mod']))
#
unit_aa['population'] = population_in
today = strftime ("%Y-%m-%d",localtime ())
unit_aa['date_mod'] = today
json_str_new = json.dumps (unit_aa)
print (json_str_new)
jedis.set (key_in,json_str_new)
#
print ("*** 終了 ***")
#
# ------------------------------------------------------------
