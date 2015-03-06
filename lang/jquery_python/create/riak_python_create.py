#! /usr/bin/python3
# -*- coding: utf-8 -*-
# -------------------------------------------------------------------------
#	riak_python_create.py
#
#						Feb/09/2015
# -------------------------------------------------------------------------
import os
import sys
import json
import pycurl
#
sys.path.append ('/var/www/data_base/common/python_common')
#
from text_manipulate import dict_append_proc
from riak_manipulate import dict_to_riak_proc
#
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
#
	dict_aa = dict_append_proc (dict_aa,'t3251',u'松江',39500,'2003-9-8')
	dict_aa = dict_append_proc (dict_aa,'t3252',u'出雲',68700,'2003-5-20')
	dict_aa = dict_append_proc (dict_aa,'t3253',u'大田',51400,'2003-1-12')
	dict_aa = dict_append_proc (dict_aa,'t3254',u'雲南',53800,'2003-9-21')
	dict_aa = dict_append_proc (dict_aa,'t3255',u'江津',73600,'2003-4-19')
	dict_aa = dict_append_proc (dict_aa,'t3256',u'浜田',84900,'2003-10-14')
	dict_aa = dict_append_proc (dict_aa,'t3257',u'益田',96500,'2003-5-24')
	dict_aa = dict_append_proc (dict_aa,'t3258',u'安来',57600,'2003-2-12')
#
	return	dict_aa
#
# -------------------------------------------------------------------------
#
url_base = 'http://localhost:8098/riak/shimane'
#
dict_aa = data_prepare_proc ()
#
url_base = 'http://host_ubuntu1:8098/riak/shimane'
#
dict_to_riak_proc (dict_aa,url_base)
#
#
print ("Content-type: text/html\n\n")
#
print	("*** OK ***<p />")
# -------------------------------------------------------------------------
