#! /usr/bin/python
# -*- coding: utf-8 -*-
# -------------------------------------------------------------------------
#	webdav_python_create.py
#
#						May/09/2013
# -------------------------------------------------------------------------
import os
import sys
import pycurl
import json
#
sys.path.append ('/var/www/data_base/common/python_common')
#
from text_manipulate import dict_append_proc
from file_io	import file_write_proc
from curl_get import couch_drop_proc
from curl_get import file_upload_proc
#
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
	dict_aa = dict_append_proc (dict_aa,'t1351',u'八王子',37800,'2003-9-2')
#
	dict_aa = dict_append_proc (dict_aa,'t1352',u'立川',73400,'2003-4-17')
#
	dict_aa = dict_append_proc (dict_aa,'t1353',u'武蔵野',75100,'2003-6-12')
	dict_aa = dict_append_proc (dict_aa,'t1354',u'三鷹',51700,'2003-7-21')
	dict_aa = dict_append_proc (dict_aa,'t1355',u'青梅',72600,'2003-4-19')
	dict_aa = dict_append_proc (dict_aa,'t1356',u'府中',84300,'2003-10-14')
	dict_aa = dict_append_proc (dict_aa,'t1357',u'昭島',96800,'2003-5-24')
	dict_aa = dict_append_proc (dict_aa,'t1358',u'調布',53600,'2003-2-12')
	dict_aa = dict_append_proc (dict_aa,'t1359',u'町田',64200,'2003-11-14')
#
	return	dict_aa
#
# -------------------------------------------------------------------------
#
url_target = 'http://host_dbase:3004/city/tokyo.json'
os.environ["http_proxy"]=''
#
dict_aa = data_prepare_proc ()
out_str = json.dumps (dict_aa)
#
file_out_tmp="/tmp/tmp00298.json"
file_write_proc (file_out_tmp,out_str)
file_upload_proc (url_target,file_out_tmp)
#
os.remove (file_out_tmp)
#
#
print "Content-type: text/html\n\n"
#
print	"*** OK ***<p />"
# -------------------------------------------------------------------------
