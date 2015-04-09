# -*- coding: utf-8 -*-
#
#	python_common/sql_to_json.py
#
#
#						Mar/12/2015
#
#		Used:	postgre_python_read.py
#
# -------------------------------------------------------------------------
import sys
import json
#
from to_utf8 import to_utf8_proc
from text_manipulate import dict_append_proc
#
# -------------------------------------------------------------------------
#
def	sql_to_json_proc (conn):
	cursor = conn.cursor ()
#
	cursor.execute ("select id,name,population,date_mod from cities order by id")
	rows=cursor.fetchall ()
#
	dict_aa = {}
	for row in rows:
		dict_aa = dict_append_proc (dict_aa,row[0], \
			str (row[1]),row[2],str (row[3]))
#			to_utf8_proc (row[1]),row[2],row[3])
#
	str_aa = json.dumps (dict_aa)
#
	print ("Content-type: text/json\n\n")
	print	(str_aa)
	cursor.close ()
#
# -------------------------------------------------------------------------
