#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	redis_update.py
#
#					Jun/23/2017
#
import	sys
import	string
import	json
#
import	datetime
import	redis
#
# ------------------------------------------------------------
sys.stderr.write("*** 開始 ***\n")
#
key_in = sys.argv[1]
population_in = int (sys.argv[2])
print ("%s\t%d" % (key_in, population_in))
#
rr = redis.Redis(host='localhost', port=6379, db=0)
#
str_json = rr.get(key_in).decode ()
unit_aa = json.loads (str_json)
now = datetime.datetime.now ()
unit_aa['population'] = population_in
unit_aa['date_mod'] =  '%s' % now
json_str = json.dumps (unit_aa)
rr.set(key_in, json_str)
#
sys.stderr.write("*** 終了 ***\n")
#
# ------------------------------------------------------------
