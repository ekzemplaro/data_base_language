#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	postgre_read.py
#					Jul/29/2014
#
# --------------------------------------------------------
import sys
import postgresql
#
print ("*** 開始 ***")
#
db = postgresql.open("pq://scott:tiger@localhost/city")
ps = db.prepare("SELECT version()")
print (ps ())
#
ps = db.prepare("SELECT * from cities")
#
for it in range (len (ps ())):
	str_out = ps ()[it][0] + "\t" + ps ()[it][1] + "\t" + str (ps ()[it][2])
	str_out += "\t" + str (ps ()[it][3])
	print (str_out)
#
ps.close ()
db.close ()
print ("*** 終了 ***")
#
# --------------------------------------------------------
