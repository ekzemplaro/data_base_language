# -*- coding:utf-8 -*-
#
#	cassandra_update.pyx
#						Nov/16/2011
#
# ---------------------------------------------------------------
import sys
import string
import datetime
import	pycassa
#
# ---------------------------------------------------------------
print ("*** 開始 ***")
#
id_in = sys.argv[1]
population_in = string.atoi (sys.argv[2])
print ("%s\t%d" % (id_in, population_in))
#
pool = pycassa.connect('Cities')
cf = pycassa.ColumnFamily(pool, 'Akita')
#
date_mod = datetime.datetime.now ()
cf.insert (id_in,{'population': str (population_in)})
cf.insert (id_in,{'date_mod': ('%s' % date_mod)})
#cf.insert (id_in,{'name': 'AAAA'})
#
data=cf.get('t0532')
#data=cf.get(id_in)
print (data)
#
llx=list(cf.get_range())
print len (llx)
for ll in llx:
	if (ll[1] != None):
		print ll[0] + '\t' + ll[1]['name'] + '\t' + ll[1]['population'],
		print '\t' + ll[1]['date_mod']
#
print ("*** 終了 ***")
# ---------------------------------------------------------------
