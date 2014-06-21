#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	delete/riak_delete.py
#
#					Dec/10/2013
# ----------------------------------------------------------------
import	os
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
import string
import httplib2
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
key_in = sys.argv[1]
print ("%s" % key_in)
#
url_target = 'http://localhost:8098/riak/shimane/' + key_in
#
http_client = httplib2.Http ()
resp, content = http_client.request(url_target, "DELETE")
#
print resp
#curl_delete_proc (url_target)
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
