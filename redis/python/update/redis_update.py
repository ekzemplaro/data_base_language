#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	redis_update.py
#
#					Dec/09/2014
#
import	sys
import	string
import	json
#
import	datetime
import	redis
#
# ------------------------------------------------------------
print ("*** 開始 ***")
#
key_in = sys.argv[1]
population_in = int (sys.argv[2])
print ("%s\t%d" % (key_in, population_in))
#
rr = redis.Redis(host='host_dbase', port=6379, db=0)
#
str_json = rr.get(key_in).decode ()
unit_aa = json.loads (str_json)
now = datetime.datetime.now ()
unit_aa['population'] = population_in
unit_aa['date_mod'] =  '%s' % now
json_str = json.dumps (unit_aa)
rr.set(key_in, json_str)
#
print ("*** 終了 ***")
#
# ------------------------------------------------------------
