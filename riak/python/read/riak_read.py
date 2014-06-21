#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	read/riak_read.py
#
#					Dec/10/2013
#
# ----------------------------------------------------------------
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
import json
import httplib2
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
http_client = httplib2.Http ()
url_shimane = 'http://localhost:8098/riak/shimane'
url_in = url_shimane + '?keys=true'
resp, content = http_client.request(url_in,"GET",headers={'cache-control':'no-cache'})
data_aa = json.loads (content)
#
#print data_aa['keys']
#
for key in sorted (data_aa['keys']):
	url_city = url_shimane + '/' + key
	resp, content = http_client.request(url_city,"GET",headers={'cache-control':'no-cache'})
	city = json.loads (content)
	print	key,"\t",
	name = city['name']
	print	name,"\t",
	print	city['population'],"\t",city['date_mod']
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
