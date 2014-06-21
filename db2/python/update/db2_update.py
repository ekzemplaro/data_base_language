#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	db2_update.py
#
#				Apr/08/2010
#
# --------------------------------------------------------
import sys
import ibm_db
from time import localtime,strftime
import datetime
#
sys.path.append ('/var/www/uchida/data_base/common/python_common')
#
from db2_disp import db2_display_proc,db2_update_proc
#
# --------------------------------------------------------
print ("*** 開始 ***")
#
conn = ibm_db.connect ('cities','','');
#
db2_update_proc	(conn,2875,123000)
db2_update_proc	(conn,2876,323000)
db2_update_proc	(conn,2877,523000)
#
db2_display_proc (conn)
#
print	"%s" %  datetime.datetime.now ()
print ("*** 終了 ***")
#
# --------------------------------------------------------
