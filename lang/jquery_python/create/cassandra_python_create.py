#! /usr/bin/python
# -*- coding: utf-8 -*-
# -------------------------------------------------------------------------
#	cassandra_python_create.py
#
#						Sep/06/2013
# -------------------------------------------------------------------------
import	sys
reload(sys)
sys.setdefaultencoding('utf-8')
import	cql
#
sys.path.append ('/var/www/data_base/common/python_common')
#
from text_manipulate import text_write_proc
from text_manipulate import dict_append_proc
from cassandra_manipulate import dict_to_cassandra_proc
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
#
	dict_aa = dict_append_proc (dict_aa,'t0531',u'秋田'.encode ('utf-8'),54200,'2003-6-12')
	dict_aa = dict_append_proc (dict_aa,'t0532',u'男鹿'.encode ('utf-8'),37800,'2003-5-24')
	dict_aa = dict_append_proc (dict_aa,'t0533',u'由利本荘'.encode ('utf-8'),51400,'2003-6-14')
	dict_aa = dict_append_proc (dict_aa,'t0534',u'横手'.encode ('utf-8'),67500,'2003-7-9')
	dict_aa = dict_append_proc (dict_aa,'t0535',u'鹿角'.encode ('utf-8'),42600,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t0536',u'大館'.encode ('utf-8'),35700,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t0537',u'能代'.encode ('utf-8'),85600,'2003-10-23')
	dict_aa = dict_append_proc (dict_aa,'t0538',u'にかほ'.encode ('utf-8'),28100,'2003-8-26')
	dict_aa = dict_append_proc (dict_aa,'t0539',u'湯沢'.encode ('utf-8'),75300,'2003-9-15')
#
	return	dict_aa
#
# -------------------------------------------------------------------------
file_out = "/var/tmp/plain_text/cities.txt"
#
dict_aa = data_prepare_proc ()
#
host = 'localhost'
port = 9160
keyspace = 'city'
con = cql.connect (host,port,keyspace,cql_version='3.0.0')
cursor = con.cursor ()
#
dict_to_cassandra_proc (dict_aa,cursor)
#
cursor.close()
con.close()
#
print "Content-type: text/html\n\n"
#
print	"*** OK ***<p />"
# -------------------------------------------------------------------------
