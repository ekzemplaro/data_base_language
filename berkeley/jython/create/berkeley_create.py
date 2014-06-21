#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	berkeley_create.db
#
#						Jul/13/2010
# -----------------------------------------------------------------
from bsddb import db
#
print ("*** 開始 ***\n")
print db.DB_VERSION_STRING + "\n"
#
db_name = "/var/tmp/berkeley/cities.db";
adb = db.DB ()
adb.open (db_name,dbtype=db.DB_HASH,flags=db.DB_CREATE)
#
#
adb["2451"]='{"name": "津","population": 81234,"date_mod": "2003-3-12"}';
adb["2452"]='{"name": "鈴鹿","population": 52374,"date_mod": "2003-5-22"}';
adb["2453"]='{"name": "伊勢","population": 413155,"date_mod": "2003-9-14"}';
adb["2454"]='{"name": "鳥羽","population": 24634,"date_mod": "2003-08-2"}';
adb["2455"]='{"name": "四日市","population": 21234,"date_mod": "2003-5-15"}';
adb["2456"]='{"name": "亀山","population": 72132,"date_mod": "2003-10-12"}';
adb["2457"]='{"name": "尾鷲","population": 22737,"date_mod": "2003-11-21"}';
adb["2458"]='{"name": "桑名","population": 9234,"date_mod": "2003-9-11"}';
adb["2459"]='{"name": "志摩","population": 92613,"date_mod": "2003-8-25"}';
adb["2460"]='{"name": "伊賀","population": 82555,"date_mod": "2003-7-2"}';
adb["2461"]='{"name": "名張","population": 72527,"date_mod": "2003-10-14"}';
adb["2462"]='{"name": "熊野","population": 62139,"date_mod": "2003-12-8"}';
#
adb.close ()
#
print ("*** 終了 ***\n")
# -----------------------------------------------------------------
