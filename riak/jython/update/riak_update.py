#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	update/riak_update.py
#
#					Aug/21/2013
#
# ----------------------------------------------------------------
import	os
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
import string
import json
import	datetime
#
sys.path.append ('/var/www/data_base/common/jython_common')
from jython_get_uri import get_uri_proc
from jython_get_uri import rest_put_proc
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
key = sys.argv[1]
population_in = string.atoi (sys.argv[2])
print ("%s\t%d" % (key, population_in))
#
host = "localhost:8098"
path = "/riak/shimane" + "/" + key
json_str = get_uri_proc (host,path)
#
print json_str
#
#
city = json.loads (json_str)
print city['name']
#
city['population'] = population_in
city['date_mod'] = '%s' % datetime.date.today ()
#
out_json = json.dumps (city)
#
print out_json
#
url_target = "http://" + host + path
rest_put_proc (url_target,out_json,"text/json")
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
