#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	firebird_read.py
#					Feb/26/2009
#
# --------------------------------------------------------
import kinterbasdb
#
#
print ("*** 開始 ***")
#
conn = kinterbasdb.connect \
	(dsn='localhost:/var/tmp/firebird/cities.fdb', \
			user="SYSDBA", password="hello9",charset="utf-8")
#
cur = conn.cursor ()
cur.execute ("select ID, Name, Population, Date_Mod from cities order by id")
#
#
rows = cur.fetchall ()
for row in rows:
	print row[0],row[1],row[2],row[3]
#
cur.close ()
conn.close ()
print ("*** end ***")
#
# --------------------------------------------------------
