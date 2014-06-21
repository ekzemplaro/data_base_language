#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	read/db2_read.py
#					Apr/08/2009
#
# --------------------------------------------------------
import sys
import ibm_db
#
sys.path.append ('/var/www/data_base/common/python_common')
#
from db2_disp import db2_display_proc
#
# --------------------------------------------------------
print ("*** 開始 ***");
#
#
conn = ibm_db.connect ('cities','','');
#
db2_display_proc (conn);
#
#
print ("*** 終了 ***");
#
# --------------------------------------------------------
