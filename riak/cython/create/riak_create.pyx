# -*- coding: utf-8 -*-
#
#	create/riak_create.pyx
#
#					Oct/02/2015
#
import sys
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_append_proc
#
from riak_manipulate import dict_to_riak_proc
# ----------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
	dict_aa = dict_append_proc (dict_aa,'t3251','松江',12847,'1949-8-12')
#
	dict_aa = dict_append_proc (dict_aa,'t3252','出雲',69175,'1949-12-15')
#
	dict_aa = dict_append_proc (dict_aa,'t3253','大田',87263,'1949-6-12')
	dict_aa = dict_append_proc (dict_aa,'t3254','雲南',53891,'1949-7-21')
	dict_aa = dict_append_proc (dict_aa,'t3255','江津',72896,'1949-4-19')
	dict_aa = dict_append_proc (dict_aa,'t3256','浜田',84129,'1949-10-14')
	dict_aa = dict_append_proc (dict_aa,'t3257','益田',96357,'1949-5-24')
	dict_aa = dict_append_proc (dict_aa,'t3258','安来',56914,'1949-9-12')
#
	return	dict_aa
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
url_base = 'http://host_ubuntu:8098/riak/shimane'
#
dict_aa = data_prepare_proc ()
#
dict_to_riak_proc (dict_aa,url_base)
#
print ("*** 終了 ***")
#
# ----------------------------------------------------------------
