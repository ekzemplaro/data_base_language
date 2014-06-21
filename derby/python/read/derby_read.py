#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	derby_read.py
#
#						Jul/07/2012
#
import	sys
reload(sys)
sys.setdefaultencoding('utf-8')
import	os
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from derby_manipulate import derby_to_dict_proc
# ------------------------------------------------------------------
print	("*** 開始 ***")
os.environ["DERBY_HOME"]="/usr/share/javadb"
#
db_name = "city_aaa"
dict_aa = derby_to_dict_proc (db_name)
#
dict_display_proc (dict_aa)
print	("*** 終了 ***")
# ------------------------------------------------------------------

