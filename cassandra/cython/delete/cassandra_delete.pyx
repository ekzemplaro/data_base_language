# -*- coding:utf-8 -*-
#
#	cassandra_delete.pyx
#						Nov/16/2011
#
# ---------------------------------------------------------------
import	sys
import	pycassa
#
# ---------------------------------------------------------------
print ("*** 開始 ***")
#
id_in = sys.argv[1]
print ("%s" % id_in)
#
pool = pycassa.connect('Cities')
cf = pycassa.ColumnFamily(pool, 'Akita')
#
cf.remove(id_in, columns=['name'])
cf.remove(id_in, columns=['population'])
cf.remove(id_in, columns=['date_mod'])
cf.remove(id_in)
#
#data=cf.get('t0532')
#data=cf.get(id_in)
#print (data)
#
llx=list(cf.get_range())
print len (llx)
#
print ("*** 終了 ***")
# ---------------------------------------------------------------
