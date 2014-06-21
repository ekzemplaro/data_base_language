#! /usr/bin/python
# -*- coding: utf-8 -*-
# -------------------------------------------------------------------------
#	gdbm_python_create.py
#
#						Jun/27/2012
# -------------------------------------------------------------------------
import	sys
import	anydbm
#
sys.path.append ('/var/www/data_base/common/python_common')
#
from dbm_manipulate import dbm_disp_proc
#
# -------------------------------------------------------------------------
#
db_name = "/var/tmp/gdbm/cities.pag";
dd = anydbm.open (db_name,"c")
#
#
dd["t2151"]='{"name": "岐阜","population": 75600,"date_mod": "2003-8-9"}';
dd["t2152"]='{"name": "大垣","population": 52100,"date_mod": "2003-7-12"}';
dd["t2153"]='{"name": "多治見","population": 14200,"date_mod": "2003-6-14"}';
dd["t2154"]='{"name": "各務原","population": 93600,"date_mod": "2003-10-2"}';
dd["t2155"]='{"name": "土岐","population": 71900,"date_mod": "2003-5-15"}';
dd["t2156"]='{"name": "高山","population": 62100,"date_mod": "2003-3-12"}';
dd["t2157"]='{"name": "美濃加茂","population": 38500,"date_mod": "2003-11-21"}';
dd["t2158"]='{"name": "恵那","population": 92600,"date_mod": "2003-10-16"}';
dd["t2159"]='{"name": "関","population": 75300,"date_mod": "2003-7-25"}';
dd["t2160"]='{"name": "中津川","population": 69400,"date_mod": "2003-12-17"}';
#
#
dd.close ()
#
#
print "Content-type: text/html\n\n"
#
print	"*** OK ***<p />"
# -------------------------------------------------------------------------
