#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	create/ftp_create.py
#
#					May/09/2013
# ----------------------------------------------------------------
#
import os
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
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
	dict_aa = dict_append_proc (dict_aa,'t0361',u'盛岡',41695,'2003-8-12')
	dict_aa = dict_append_proc (dict_aa,'t0362',u'久慈',38724,'2003-5-15')
	dict_aa = dict_append_proc (dict_aa,'t0363',u'二戸',56271,'2003-6-12')
	dict_aa = dict_append_proc (dict_aa,'t0364',u'宮古',71538,'2003-7-21')
	dict_aa = dict_append_proc (dict_aa,'t0365',u'遠野',79682,'2003-4-19')
	dict_aa = dict_append_proc (dict_aa,'t0366',u'八幡平',89532,'2003-10-14')
	dict_aa = dict_append_proc (dict_aa,'t0367',u'大船渡',96273,'2003-5-24')
	dict_aa = dict_append_proc (dict_aa,'t0368',u'一関',53927,'2003-2-12')
	dict_aa = dict_append_proc (dict_aa,'t0369',u'花巻',64736,'2003-11-14')
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
