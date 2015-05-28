#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	derby_read.py
#
#						May/26/2015
#
import	sys
import	os
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from derby_manipulate import derby_to_dict_proc
# ------------------------------------------------------------------
print	("*** 開始 ***")
#os.environ["DERBY_HOME"]="/usr/share/javadb"
# os.environ["DERBY_HOME"]="/usr/share/java/derby/bin"
#
db_name = "city_aaa"
dict_aa = derby_to_dict_proc (db_name)
print ("*** check ppp ***")
#
dict_display_proc (dict_aa)
print	("*** 終了 ***")
# ------------------------------------------------------------------
