#! /usr/bin/python3
# -*- coding: utf-8 -*-
# -------------------------------------------------------------------------
#	couch_python_create.py
#
#						May/06/2015
# -------------------------------------------------------------------------
import os
import sys
#
sys.path.append ('/var/www/data_base/common/python_common')
#
from text_manipulate import dict_append_proc
#
from couch_manipulate import dict_to_couch_proc
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
	dict_aa = dict_append_proc (dict_aa,'t2021','長野',92300,'2003-6-12')
#
	dict_aa = dict_append_proc (dict_aa,'t2022','松本',73100,'2003-3-15')
#
	dict_aa = dict_append_proc (dict_aa,'t2023','上田',75100,'2003-9-12')
	dict_aa = dict_append_proc (dict_aa,'t2024','小諸',51800,'2003-2-21')
	dict_aa = dict_append_proc (dict_aa,'t2025','岡谷',72600,'2003-4-19')
	dict_aa = dict_append_proc (dict_aa,'t2026','塩尻',84300,'2003-10-14')
	dict_aa = dict_append_proc (dict_aa,'t2027','茅野',96800,'2003-5-24')
	dict_aa = dict_append_proc (dict_aa,'t2028','飯田',53600,'2003-8-12')
	dict_aa = dict_append_proc (dict_aa,'t2029','中野',64200,'2003-11-14')
	dict_aa = dict_append_proc (dict_aa,'t2030','諏訪',82100,'2003-7-04')
	dict_aa = dict_append_proc (dict_aa,'t2031','駒ヶ根',47800,'2003-9-17')
	dict_aa = dict_append_proc (dict_aa,'t2032','佐久',25300,'2003-7-20')
	dict_aa = dict_append_proc (dict_aa,'t2033','伊那',12700,'2003-3-12')
	dict_aa = dict_append_proc (dict_aa,'t2034','千曲',63400,'2003-1-14')
#
	return	dict_aa
#
# -------------------------------------------------------------------------
#
dict_aa = data_prepare_proc ()
#
os.environ["http_proxy"]=''
url_collection = 'http://localhost:5984/nagano'
#
dict_to_couch_proc (dict_aa,url_collection)
#
print ("Content-type: text/html\n\n")
#
print	("*** OK ***<p />")
# -------------------------------------------------------------------------
