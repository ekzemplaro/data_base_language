# -*- coding:utf-8 -*-
#
#	cassandra_create.pyx
#						Nov/16/2011
#
# ---------------------------------------------------------------
import sys
#
import	pycassa
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from text_manipulate import dict_append_proc
# ---------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t0531',u'秋田'.encode ('utf-8'),59176,'1925-4-30')
	dict_aa = dict_append_proc (dict_aa,'t0532',u'男鹿'.encode ('utf-8'),47235,'1925-5-10')
	dict_aa = dict_append_proc (dict_aa,'t0533',u'由利本荘'.encode ('utf-8'),26654,'1925-6-14')
	dict_aa = dict_append_proc (dict_aa,'t0534',u'横手'.encode ('utf-8'),83672,'1925-9-9')
	dict_aa = dict_append_proc (dict_aa,'t0535',u'鹿角'.encode ('utf-8'),42391,'1925-8-4')
	dict_aa = dict_append_proc (dict_aa,'t0536',u'大館'.encode ('utf-8'),35187,'1925-1-21')
	dict_aa = dict_append_proc (dict_aa,'t0537',u'能代'.encode ('utf-8'),81246,'1925-7-23')
	dict_aa = dict_append_proc (dict_aa,'t0538',u'にかほ'.encode ('utf-8'),24784,'1925-10-26')
	dict_aa = dict_append_proc (dict_aa,'t0539',u'湯沢'.encode ('utf-8'),35826,'1925-12-17')
#
	return	dict_aa
#
# ---------------------------------------------------------------
#
print ("*** 開始 ***")
#
dict_aa = data_prepare_proc ()
#dict_display_proc (dict_aa)
#
pool = pycassa.connect('Cities')
cf = pycassa.ColumnFamily(pool, 'Akita')
#data=cf.get('t0531')
#print (data)
#
for key in dict_aa.keys ():
	unit = dict_aa[key]
	cf.insert (key,{'name': unit['name']})
	cf.insert (key,{'population': str (unit['population'])})
	cf.insert (key,{'date_mod': unit['date_mod']})
#
llx=list(cf.get_range())
print len (llx)
for ll in llx:
	if (0 < cf.get_count (ll[0])):
		print ll[0] + '\t' + ll[1]['name'] + '\t' + ll[1]['population'],
		print '\t' + ll[1]['date_mod']
#
print ("*** 終了 ***")
# ---------------------------------------------------------------
