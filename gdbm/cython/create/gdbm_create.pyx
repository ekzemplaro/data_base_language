# -*- coding: utf-8 -*-
#
#	gdbm_create.pyx
#
#					Nov/03/2011
# -------------------------------------------------------------
import	os
import	sys
import	string
import anydbm
#
sys.path.append ('/var/www/data_base/common/python_common')
#
from dbm_manipulate import dbm_disp_proc,dbm_update_proc
# -------------------------------------------------------------
print ("*** 開始 ***")
#
#
db_name = "/var/tmp/gdbm/cities.pag";
if os.path.exists (db_name):
	os.remove (db_name)
#
dd = anydbm.open (db_name,"c")
#
#
dd["t2151"]='{"name": "岐阜","population": 71237,"date_mod": "1925-7-24"}';
dd["t2152"]='{"name": "大垣","population": 52876,"date_mod": "1925-8-12"}';
dd["t2153"]='{"name": "多治見","population": 42159,"date_mod": "1925-9-14"}';
dd["t2154"]='{"name": "各務原","population": 47631,"date_mod": "1925-8-2"}';
dd["t2155"]='{"name": "土岐","population": 21254,"date_mod": "1925-5-15"}';
dd["t2156"]='{"name": "高山","population": 92136,"date_mod": "1925-10-12"}';
dd["t2157"]='{"name": "美濃加茂","population": 82134,"date_mod": "1925-11-21"}';
dd["t2158"]='{"name": "恵那","population": 92384,"date_mod": "1925-10-11"}';
dd["t2159"]='{"name": "関","population": 92635,"date_mod": "1925-7-25"}';
dd["t2160"]='{"name": "中津川","population": 92842,"date_mod": "1925-12-4"}';
#
dbm_disp_proc (dd)
#
dd.close ()
os.chmod (db_name,0666)
#
print ("*** 終了 ***")
# -------------------------------------------------------------
