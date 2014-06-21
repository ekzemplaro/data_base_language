#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	read/voldemort_read.py
#
#					Sep/09/2013
#
# ----------------------------------------------------------------
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
import json
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
#
import java
from voldemort.client import SocketStoreClientFactory
from voldemort.client import ClientConfig
# ----------------------------------------------------------------
def voldemort_to_dict_proc (client):
	print ("*** voldemort_to_dict_proc *** start ***")
	dict_aa = {}
#
	keys = ["t3051","t3052","t3053", \
		"t3054","t3055","t3056", \
		"t3057","t3058","t3059"]
#
	for key in keys:
#		print (key)
		version = client.get(key)
#		print (version)
		if (version != None):
			json_str = version.getValue ()
#			print (json_str)
			unit_aa = json.loads (json_str)
			dict_aa[key] = unit_aa
	return	dict_aa
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
factory = SocketStoreClientFactory (ClientConfig().setBootstrapUrls("tcp://localhost:6666"))
#
client = factory.getStoreClient ("cities")
dict_aa = voldemort_to_dict_proc (client)
dict_display_proc (dict_aa)
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
