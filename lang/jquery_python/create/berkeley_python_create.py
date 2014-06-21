#! /usr/bin/python
# -*- coding: utf-8 -*-
# -------------------------------------------------------------------------
#	berkeley_python_create.py
#
#						May/29/2013
# -------------------------------------------------------------------------
import	os
from bsddb import db
#
#
# -------------------------------------------------------------------------
#
db_name = "/var/tmp/berkeley/cities.db";
#
if os.path.exists (db_name):
	os.remove (db_name)
#
adb = db.DB ()
adb.open (db_name,dbtype=db.DB_HASH,flags=db.DB_CREATE)
#
#
adb["t2451"]='{"name": "津","population": 51200,"date_mod": "2003-3-15"}';
adb["t2452"]='{"name": "鈴鹿","population": 49700,"date_mod": "2003-5-21"}';
adb["t2453"]='{"name": "伊勢","population": 27300,"date_mod": "2003-9-14"}';
adb["t2454"]='{"name": "鳥羽","population": 14600,"date_mod": "2003-8-2"}';
adb["t2455"]='{"name": "四日市","population": 21400,"date_mod": "2003-5-15"}';
adb["t2456"]='{"name": "亀山","population": 72100,"date_mod": "2003-10-12"}';
adb["t2457"]='{"name": "尾鷲","population": 52700,"date_mod": "2003-11-21"}';
adb["t2458"]='{"name": "桑名","population": 29300,"date_mod": "2003-8-11"}';
adb["t2459"]='{"name": "志摩","population": 61800,"date_mod": "2003-3-25"}';
adb["t2460"]='{"name": "伊賀","population": 83900,"date_mod": "2003-9-2"}';
adb["t2461"]='{"name": "名張","population": 72400,"date_mod": "2003-10-14"}';
adb["t2462"]='{"name": "熊野","population": 69100,"date_mod": "2003-12-8"}';
#
adb.close ()
#
os.chmod (db_name,0777)
#
print "Content-type: text/html\n\n"
#
print	"*** OK ***<p />"
# -------------------------------------------------------------------------
