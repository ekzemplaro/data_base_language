#! /usr/bin/python
# -*- coding: utf-8 -*-
# -------------------------------------------------------------------------
#	sqlite3_python_create.py
#
#						Jul/02/2011
# -------------------------------------------------------------------------
import	sys
import	json
import	sqlite3
sys.path.append ('/var/www/data_base/common/python_common')
#
from file_io import file_write_proc
from sql_manipulate import table_insert_proc,sql_insert_proc,create_table_proc,drop_table_proc
from text_manipulate import dict_append_proc
#
#
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t0711','郡山',82700,'2003-9-12')
	dict_aa = dict_append_proc (dict_aa,'t0712','会津若松',47900,'2003-5-10')
	dict_aa = dict_append_proc (dict_aa,'t0713','白河',21600,'2003-6-14')
	dict_aa = dict_append_proc (dict_aa,'t0714','福島',83600,'2003-9-9')
	dict_aa = dict_append_proc (dict_aa,'t0715','喜多方',42300,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t0716','二本松',35100,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t0717','いわき',81200,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t0718','相馬',24700,'2003-10-26')
	dict_aa = dict_append_proc (dict_aa,'t0719','須賀川',71200,'2003-12-15')
#
	return	dict_aa
#
# -------------------------------------------------------------------------
#
dict_aa = data_prepare_proc ()
#
file_out="/var/tmp/sqlite3/cities.db"
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
#
print "Content-type: text/html\n\n"
#
print	"*** OK ***<p />"
# -------------------------------------------------------------------------
