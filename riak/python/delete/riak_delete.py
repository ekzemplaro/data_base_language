#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	delete/riak_delete.py
#
#					Sep/22/2015
# ----------------------------------------------------------------
import sys
#
sys.path.append ('/var/www/data_base/common/python_common')
from curl_get import curl_delete_proc
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
key_in = sys.argv[1]
print ("%s" % key_in)
#
url_base = 'http://host_ubuntu:8098/riak/shimane'
url_target = url_base + '/' + key_in
#
curl_delete_proc (url_target)
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
