#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	voldemort_delete.py
#
#					Sep/10/2013
#
# ----------------------------------------------------------------
import	os
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
import string
#
#sys.path.append ('/var/www/data_base/common/jython_common')
#
import java
from voldemort.client import SocketStoreClientFactory
from voldemort.client import ClientConfig
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
key = sys.argv[1]
print (key)
#
factory = SocketStoreClientFactory (ClientConfig().setBootstrapUrls("tcp://localhost:6666"))
#
client = factory.getStoreClient ("cities")
#
version = client.get(key)
print (version)
if (version != None):
	json_str = version.getValue ()
	print json_str
	client.delete (key)
#
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
