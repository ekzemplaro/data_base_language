#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	update/voldemort_update.py
#
#					Sep/10/2013
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
#sys.path.append ('/var/www/data_base/common/jython_common')
#
import java
from voldemort.client import SocketStoreClientFactory
from voldemort.client import ClientConfig
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
key = sys.argv[1]
population_in = string.atoi (sys.argv[2])
print ("%s\t%d" % (key, population_in))
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
#
#
#
city = json.loads (json_str)
print city['name']
#
city['population'] = population_in
city['date_mod'] = '%s' % datetime.date.today ()
#
json_new = json.dumps (city)
#
print json_new
#
client.put (key,json_new)
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
