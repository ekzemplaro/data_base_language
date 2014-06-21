#! /usr/bin/python
# -*- coding: utf-8 -*-
# -------------------------------------------------------------------------
#	mssql_python_create.py
#
#						Jan/18/2011
# -------------------------------------------------------------------------
import	sys
import	pymssql
sys.path.append ('/var/www/data_base/common/python_common')
#
from sql_manipulate import table_insert_proc,sql_insert_proc,create_table_proc,drop_table_proc
#
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	array_aa = []
#
	array_aa.append ({'id':1071,'name':'Maebashi','population':24500,'date_mod':'2003-4-29'});
	array_aa.append ({'id':1072,'name':'Takasaki','population':52100,'date_mod':'2003-9-21'});
	array_aa.append ({'id':1073,'name':'桐生','population':41200,'date_mod':'2003-06-9'});
	array_aa.append ({'id':1074,'name':'沼田','population':43100,'date_mod':'2003-06-18'});
	array_aa.append ({'id':1075,'name':'Isezaki','population':73500,'date_mod':'2003-06-21'});
	array_aa.append ({'id':1076,'name':'Minakami','population':21800,'date_mod':'2003-06-14'});
	array_aa.append ({'id':1077,'name':'太田','population':52100,'date_mod':'2003-06-23'});
#	array_aa.append ({'id':1078,'name':'Annaka','population':74100,'date_mod':'2003-4-12'});
	array_aa.append ({'id':1078,'name':'安中','population':92400,'date_mod':'2003-4-12'});
	array_aa.append ({'id':1079,'name':'Midori','population':34500,'date_mod':'2003-9-8'});
#	array_aa.append ({'id':1079,'name':'みどり','population':76500,'date_mod':'2003-9-8'});
#
	array_bb = {'cities': array_aa}
#
	return	array_bb
#
# -------------------------------------------------------------------------
#
array_bb = data_prepare_proc ()
#
conn = pymssql.connect \
	(host='cdbd025\SQLEXPRESS',user='sa', password='hello9',database='city')
#
cursor = conn.cursor ()
#
drop_table_proc (cursor)
sql_str="create table cities (id int, name varchar(20)," \
                + " population int, date_mod datetime)"
cursor.execute (sql_str)
conn.commit ()
#
table_insert_proc (cursor,array_bb)
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
