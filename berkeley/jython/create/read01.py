#! /usr/bin/python
# -*- coding: utf-8 -*-
#
from bsddb import db
#
db_name = "/var/tmp/berkeley/cities.db";
adb = db.DB ()
adb.open (db_name)
for lang in adb.keys ():
	print lang, adb[lang]
adb.close ()
#
