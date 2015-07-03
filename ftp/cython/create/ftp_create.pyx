# -*- coding: utf-8 -*-
#
#	create/ftp_create.pyx
#
#					Jul/03/2015
# ----------------------------------------------------------------
#
import os
import sys
import pycurl
import json
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate	import dict_display_proc
from text_manipulate	import dict_append_proc
from file_io	import file_write_proc
from curl_get import couch_drop_proc
from curl_get import file_upload_proc
#
# ----------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
#
	dict_aa = dict_append_proc (dict_aa,'t0361','盛岡',41795,'1949-8-12')
	dict_aa = dict_append_proc (dict_aa,'t0362','久慈',38624,'1949-5-15')
	dict_aa = dict_append_proc (dict_aa,'t0363','二戸',78136,'1949-6-12')
	dict_aa = dict_append_proc (dict_aa,'t0364','宮古',51438,'1949-7-21')
	dict_aa = dict_append_proc (dict_aa,'t0365','遠野',79682,'1949-4-19')
	dict_aa = dict_append_proc (dict_aa,'t0366','八幡平',82537,'1949-10-14')
	dict_aa = dict_append_proc (dict_aa,'t0367','大船渡',96174,'1949-5-24')
	dict_aa = dict_append_proc (dict_aa,'t0368','一関',53921,'1949-2-12')
	dict_aa = dict_append_proc (dict_aa,'t0369','花巻',64716,'1949-11-14')
#
	return	dict_aa

#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
url_target = 'ftp://scott:tiger@host_dbase/city/iwate.json'
#
dict_aa = data_prepare_proc ()
#
dict_display_proc (dict_aa)
#
out_str = json.dumps (dict_aa)
file_out_tmp="/tmp/tmp00871.json"
file_write_proc (file_out_tmp,out_str)
file_upload_proc (url_target,file_out_tmp)
#
os.remove (file_out_tmp)
#
print ("*** 終了 ***")
