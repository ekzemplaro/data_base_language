# -*- coding: utf-8 -*-
#
#	read/couch_read.pyx
#
#					Mar/29/2013
#
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
import pycurl
import json
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from curl_get import curl_get_proc
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
#
url_json = 'http://host_dbase:5984/city/cities'
str_tmp = curl_get_proc (url_json)

#print (str_tmp)

dict_aa = json.loads (str_tmp)
dict_display_proc (dict_aa)
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
