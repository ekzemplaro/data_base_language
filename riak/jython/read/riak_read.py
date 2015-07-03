#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	read/riak_read.py
#
#					Aug/21/2013
#
# ----------------------------------------------------------------
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
import json
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from text_manipulate import dict_append_proc
#
sys.path.append ('/var/www/data_base/common/jython_common')
from jython_get_uri import get_uri_proc
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
host = "host_ubuntu1:8098"
path = "/riak/shimane" + "?keys=true"
json_str = get_uri_proc (host,path)
#
data_aa = json.loads (json_str)
#
dict_aa = {}
for key in sorted (data_aa['keys']):
	path = "/riak/shimane" + '/' + key
	content = get_uri_proc (host,path)
	city = json.loads (content)
	dict_aa[key] = city
#
dict_display_proc (dict_aa)
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
