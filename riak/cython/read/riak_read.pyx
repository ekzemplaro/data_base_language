# -*- coding: utf-8 -*-
#
#	read/riak_read.pyx
#
#					Oct/02/2015
#
import sys
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
#
from riak_manipulate import riak_to_dict_proc
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
url_shimane = 'http://host_ubuntu:8098/riak/shimane'

dict_aa = riak_to_dict_proc (url_shimane)

dict_display_proc (dict_aa)
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
