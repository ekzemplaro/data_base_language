#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	couchdb_update.py
#
#					Oct/30/2014
#
# ----------------------------------------------------------------
import os
import sys
import pycurl
import json
import cgi
#
sys.path.append ('/var/www/data_base/common/python_common')
#
#from curl_get import curl_get_proc
#from curl_get import curl_put_proc
#
# ----------------------------------------------------------------
def curl_put_proc (url,str_json):
#
	message = []
	message.append ("*** curl_put_proc *** start ***")
	cc = pycurl.Curl ()
	cc.setopt(cc.PROXY, '')
	message.append ("*** curl_put_proc *** bbb ***")
	cc.setopt (pycurl.URL, url)
	message.append ("*** curl_put_proc *** ccc ***")
	cc.setopt(pycurl.CUSTOMREQUEST, "PUT")
	message.append ("*** curl_put_proc *** ddd ***")
	cc.setopt (pycurl.POST, 1)
	message.append ("*** curl_put_proc *** eee ***")
	cc.setopt (pycurl.POSTFIELDS, str_json)
	message.append ("*** curl_put_proc *** fff ***")
#
##	cc.perform ()
	message.append ("*** curl_put_proc *** ggg ***")
#	cc.close ()
#
	message.append ("*** curl_put_proc *** end ***")
#
	return	message
# ----------------------------------------------------------------
print ("Content-type: text/json; charset=UTF-8\n\n")

message = []
message.append ("*** couchdb_update *** start ***")
# print ("*** 開始 ***")
#
os.environ["http_proxy"]=''
#
# print (os.environ['REQUEST_METHOD'])
#
form = cgi.FieldStorage()
url_key = form["url_key"].value
my_data = form["my_data"].value
#
message.append (url_key)
data_in = json.loads (my_data)
message.append (data_in["_id"])
#json_str = str (json.dumps (my_data),"UTF-8")
json_str = json.dumps (my_data)
#
message.append (json_str)
message.append ("*** before *** curl_put_proc ***")
message += curl_put_proc (url_key,json_str)
message.append ("*** after *** curl_put_proc ***")
#
message.append ("*** couchdb_update *** end ***")
#str_json = str (curl_get_proc (url),'UTF-8')
rvalue = {}
rvalue["message"] = message
rvalue["my_data"] = my_data
str_json = json.dumps (rvalue)
print (str_json)
#
# print ("*** 終了 ***")
# ----------------------------------------------------------------
