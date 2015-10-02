#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	create/riak_create.py
#
#					Feb/09/2015
#
# ----------------------------------------------------------------
import sys
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_append_proc
from riak_manipulate import dict_to_riak_proc
#
# ----------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
	dict_aa = dict_append_proc (dict_aa,'t3251','松江',31289,'2003-2-9')
#
	dict_aa = dict_append_proc (dict_aa,'t3252','出雲',68714,'2003-7-20')
#
	dict_aa = dict_append_proc (dict_aa,'t3253','大田',58162,'2003-5-12')
	dict_aa = dict_append_proc (dict_aa,'t3254','雲南',57238,'2003-9-21')
	dict_aa = dict_append_proc (dict_aa,'t3255','江津',73896,'2003-4-19')
	dict_aa = dict_append_proc (dict_aa,'t3256','浜田',84129,'2003-10-14')
	dict_aa = dict_append_proc (dict_aa,'t3257','益田',96851,'2003-5-24')
	dict_aa = dict_append_proc (dict_aa,'t3258','安来',52476,'2003-2-12')
#
	return	dict_aa
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
dict_aa = data_prepare_proc ()
#
url_base = 'http://host_ubuntu:8098/riak/shimane'
#
dict_to_riak_proc (dict_aa,url_base)
#
print ("*** 終了 ***")
#
# ----------------------------------------------------------------
