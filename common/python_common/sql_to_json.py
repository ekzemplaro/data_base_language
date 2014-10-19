# -*- coding: utf-8 -*-
#
#	python_common/sql_to_json.py
#
#
#						May/19/2011
#
#		Used:	postgre_python_read.py
#
import sys
import json
from to_utf8 import to_utf8_proc
#
#
def	sql_to_json_proc (conn):
	cursor = conn.cursor ()
#
	cursor.execute ("select ID, Name, Population, Date_Mod from cities order by id")
	rows=cursor.fetchall ()
#
	str_aa='{'

	llx = len (rows)
	it = 0
	for row in rows:
		str_unit = '"%s": {"name":"%s","population":%s,"date_mod":"%s"}' \
		% (row[0],to_utf8_proc (row[1]),row[2],row[3])
		str_aa += str_unit
		it += 1
		if (it < llx): 
			str_aa += ','
		else:
			str_aa += '}'
#
	print "Content-type: text/json\n\n"
	print	str_aa
	cursor.close ()
#
