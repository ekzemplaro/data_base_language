#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	update/riak_update.py
#
#					Dec/10/2013
#
# ----------------------------------------------------------------
import	os
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
import string
import httplib2
import json
import	datetime
#
sys.path.append ('/var/www/data_base/common/python_common')
from curl_get import curl_get_proc
from curl_get import curl_put_proc
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
key_in = sys.argv[1]
population_in = string.atoi (sys.argv[2])
print ("%s\t%d" % (key_in, population_in))
#
url_target = 'http://localhost:8098/riak/shimane/' + key_in
#
http_client = httplib2.Http ()
resp, content = http_client.request(url_target, "GET")
#
print content
#
city = json.loads (content)
print city['name']
#
city['population'] = population_in
city['date_mod'] = '%s' % datetime.date.today ()
#
out_json = json.dumps (city)
#
print out_json
#
resp, content = http_client.request(url_target,"PUT",headers={'content-type':'application/json'},body=out_json)
print resp
#curl_put_proc (url_target,out_json)
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
