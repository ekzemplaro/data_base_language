#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	gdbm_create.py
#
#					Jul/13/2010
import	sys
import	string
import anydbm
#
sys.path.append ('/var/www/uchida/data_base/common/python_common')
#
from dbm_manipulate import dbm_disp_proc,dbm_update_proc
# -------------------------------------------------------------
print ("*** 開始 ***")
#
#
db_name = "/var/tmp/gdbm/cities.pag";
dd = anydbm.open (db_name,"c")
#
#
dd["2151"]='{"name": "岐阜","population": 70230,"date_mod": "2003-7-24"}';
dd["2152"]='{"name": "大垣","population": 52070,"date_mod": "2003-8-12"}';
dd["2153"]='{"name": "多治見","population": 420155,"date_mod": "2003-9-14"}';
dd["2154"]='{"name": "各務原","population": 44630,"date_mod": "2003-8-2"}';
dd["2155"]='{"name": "土岐","population": 21204,"date_mod": "2003-5-15"}';
dd["2156"]='{"name": "高山","population": 92130,"date_mod": "2003-10-12"}';
dd["2157"]='{"name": "美濃加茂","population": 82034,"date_mod": "2003-11-21"}';
dd["2158"]='{"name": "恵那","population": 92304,"date_mod": "2003-10-11"}';
dd["2159"]='{"name": "関","population": 926340,"date_mod": "2003-7-25"}';
dd["2160"]='{"name": "中津川","population": 920534,"date_mod": "2003-12-4"}';
#
dbm_disp_proc (dd)
#
dd.close ()
#
print ("*** 終了 ***")
# -------------------------------------------------------------
