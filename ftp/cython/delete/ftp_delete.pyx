# -*- coding: utf-8 -*-
#
#	delete/ftp_delete.pyx
#
#					Jul/03/2015
# ----------------------------------------------------------------
#
import	os
import sys
import string
import pycurl
import json
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_delete_proc
from curl_get import curl_get_proc
from curl_get import file_upload_proc
from file_io	import file_write_proc
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
key_in = sys.argv[1]
print ("%s" % key_in)
#
url_json = 'ftp://scott:tiger@host_dbase/city/iwate.json'
#
str_buf_aa = curl_get_proc (url_json)
#
print "len (str_buf) = %d\n" % len (str_buf_aa)
#
dict_aa = json.loads (str (str_buf_aa,'UTF-8'))
#
dict_bb = dict_delete_proc (dict_aa,key_in)
#
out_str = json.dumps (dict_bb)
#
file_out="/tmp/tmp00951.json"
file_write_proc (file_out,out_str)
file_upload_proc (url_json,file_out)
#
os.remove (file_out)
#
print ("*** 終了 ***")
