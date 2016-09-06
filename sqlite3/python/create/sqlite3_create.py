#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	sqlite3_create.py
#
#					Sep/06/2016
#
# -------------------------------------------------------------------------
import	sys
import	sqlite3
#
sys.path.append ('/var/www/data_base/common/python_common')
from sql_manipulate import table_insert_proc,create_table_proc,drop_table_proc
from text_manipulate import dict_append_proc
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t0711','郡山',52176,'2003-4-12')
	dict_aa = dict_append_proc (dict_aa,'t0712','会津若松',47935,'2003-5-10')
	dict_aa = dict_append_proc (dict_aa,'t0713','白河',21654,'2003-6-14')
	dict_aa = dict_append_proc (dict_aa,'t0714','福島',83672,'2003-9-9')
	dict_aa = dict_append_proc (dict_aa,'t0715','喜多方',42391,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t0716','二本松',35187,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t0717','いわき',87246,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t0718','相馬',91784,'2003-10-26')
	dict_aa = dict_append_proc (dict_aa,'t0719','須賀川',75823,'2003-12-15')
#
	return	dict_aa
#
# -------------------------------------------------------------------------
def	sqlite3_write_proc (file_out,dict_aa):
	conn = sqlite3.connect (file_out)
	cursor = conn.cursor ()
#
	drop_table_proc (cursor)
	create_table_proc (cursor)
#
	table_insert_proc (cursor,dict_aa)
#
	conn.commit ()
	cursor.close ()
	conn.close ()
#
# -------------------------------------------------------------------------
sys.stderr.write ("*** 開始 ***\n")
#
file_out = sys.argv[1];
#
print	(file_out)
#
dict_aa = data_prepare_proc ()
#
sqlite3_write_proc (file_out,dict_aa)
#
sys.stderr.write ("*** 終了 ***\n")
# -------------------------------------------------------------------------
