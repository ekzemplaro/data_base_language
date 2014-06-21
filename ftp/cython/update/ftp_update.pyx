# -*- coding: utf-8 -*-
#
#	update/ftp_update.pyx
#
#					Mar/29/2013
# ----------------------------------------------------------------
#
import	os
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
import string
import pycurl
import json
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from text_manipulate import dict_update_proc
from file_io	import file_write_proc
from curl_get import curl_get_proc
from curl_get import file_upload_proc
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
id_in = sys.argv[1]
population_in = string.atoi (sys.argv[2])
print ("%s\t%d" % (id_in, population_in))
#
url_json = 'ftp://scott:tiger@host_dbase/city/iwate.json'
#
str_buf_aa = curl_get_proc (url_json)
#
print "len (str_buf) = %d\n" % len (str_buf_aa)
#
dict_aa = json.loads (str_buf_aa)
#
dict_bb = dict_update_proc (dict_aa,id_in,population_in)
#
dict_display_proc (dict_aa)
#
out_str = json.dumps (dict_aa)
#
file_out="/tmp/tmp00451.json"
file_write_proc (file_out,out_str)
file_upload_proc (url_json,file_out)
#
os.remove (file_out)
#
print ("*** 終了 ***")
