#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	derby_python_read.py
#
#						Jul/09/2012
#
# ----------------------------------------------------------------
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
import json
import os
#
sys.path.append ("/var/www/data_base/common/python_common")
from derby_manipulate import derby_to_dict_proc
#
os.environ["DERBY_HOME"]="/usr/share/javadb"
db_name = "city_aaa"
dict_aa = derby_to_dict_proc (db_name)
#
str_aa = json.dumps (dict_aa)
#
print "Content-type: text/json\n\n"
print	str_aa
#	
