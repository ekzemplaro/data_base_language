# -*- coding: utf-8 -*-
#
#	read/couch_read.pyx
#
#					Jun/02/2015
#
import sys
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
#
from couch_manipulate import couch_to_dict_proc
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
url_json = 'http://localhost:5984/nagano'

dict_aa = couch_to_dict_proc (url_json)

dict_display_proc (dict_aa)
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
