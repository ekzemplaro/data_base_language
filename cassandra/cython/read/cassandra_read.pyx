# -*- coding:utf-8 -*-
#
#	cassandra_read.pyx
#						Nov/16/2011
#
# ---------------------------------------------------------------
import sys
#
import	pycassa
#
print ("*** 開始 ***")
#
pool = pycassa.connect('Cities')
cf = pycassa.ColumnFamily(pool, 'Akita')
#data=cf.get('t0531')
#print (data)
llx=list(cf.get_range())
print len (llx)
for ll in llx:
	if (0 < cf.get_count (ll[0])):
		print ll[0] + '\t' + ll[1]['name'] + '\t' + ll[1]['population'],
		print '\t' + ll[1]['date_mod']
#
print ("*** 終了 ***")
# ---------------------------------------------------------------
