# -*- coding: utf-8 -*-
#
#	berkeley_read.py
#
#					Jul/03/2015
import	sys
from bsddb3 import db
import string
#
sys.path.append ('/var/www/data_base/common/python_common')
from dbm_manipulate import dbm_to_dict_proc
from text_manipulate import dict_display_proc
# -------------------------------------------------------------
print	("*** 開始 ***")
#
print db.DB_VERSION_STRING + "\n"
db_name = sys.argv[1]
#
#dd = anydbm.open (db_name,"c")
adb = db.DB ()
#adb.open (db_name,dbtype=db.DB_HASH)
adb.open (db_name)
#
dict_aa = dbm_to_dict_proc (adb)
adb.close ()
#
dict_display_proc (dict_aa)
#
print	("*** 終了 ***")
#
# -------------------------------------------------------------
