#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	read/couch_read.py
#
#					Aug/01/2017
#
# ----------------------------------------------------------------
import os
import sys
#
sys.path.append('../../../common/python_common')
from text_manipulate import dict_display_proc
#
from couch_manipulate import couch_to_dict_proc
# ----------------------------------------------------------------
sys.stderr.write("*** 開始 ***\n")
#
os.environ["http_proxy"]=''
#
url_json = 'http://localhost:5984/nagano'
#
dict_aa = couch_to_dict_proc(url_json)
#
dict_display_proc(dict_aa)
#
sys.stderr.write("*** 終了 ***\n")
# ----------------------------------------------------------------
