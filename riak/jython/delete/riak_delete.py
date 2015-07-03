#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	delete/riak_delete.py
#
#					Jun/25/2015
# ----------------------------------------------------------------
import	os
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
#
sys.path.append ('/var/www/data_base/common/jython_common')
from jython_get_uri import rest_delete_proc
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
key_in = sys.argv[1]
print ("%s" % key_in)
#
url_target = 'http://host_ubuntu1:8098/riak/shimane/' + key_in
#
rest_delete_proc (url_target)
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
