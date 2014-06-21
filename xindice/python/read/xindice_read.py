#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#
#	read/xindice_read.py
#
#					May/31/2012
#
# ------------------------------------------------------------------
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
#
sys.path.append ("/var/www/data_base/common/python_common")
from curl_get import curl_get_proc
from text_manipulate import dict_display_proc
from xml_manipulate import xml_to_dict_proc
#
# ------------------------------------------------------------------
print ("*** 開始 ***")
	
server_db = 'http://cddn007:8888/xindice/db/'
url_in = server_db + 'cities/cities'
#
str_aa = curl_get_proc (url_in)
#
dict_aa=xml_to_dict_proc (str_aa)
dict_display_proc (dict_aa)
#
print ("*** 終了 ***")
# ------------------------------------------------------------------
