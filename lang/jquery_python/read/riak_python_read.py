#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	riak_python_read.py
#
#						Dec/10/2013
#
#
# ---------------------------------------------------------------------
import sys
import httplib2
import json
#
sys.path.append ('/var/www/data_base/common/python_common')
from curl_get import curl_get_proc
# ---------------------------------------------------------------------
print "Content-type: text/json\n\n"

http_client = httplib2.Http ()
url_shimane = 'http://localhost:8098/riak/shimane'
url_in = url_shimane + '?keys=true'
resp, content = http_client.request(url_in,"GET",headers={'cache-control':'no-cache'})
data_aa = json.loads (content)

dict_aa = {}
for key in sorted (data_aa['keys']):
	url_city = url_shimane + '/' + key
	resp, content = http_client.request(url_city,"GET",headers={'cache-control':'no-cache'})
	city = json.loads (content)
	dict_aa[key] = city
#
str_json = json.dumps (dict_aa)

sys.stdout.write (str_json)
#
# ---------------------------------------------------------------------
