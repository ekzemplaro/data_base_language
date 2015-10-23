# -*- coding: utf-8 -*-
#
#	redis_delete.pyx
#
#					Jul/03/2015
#
import	sys
import	string
import	json
#
import	redis
#
sys.path.append ('/var/www/data_base/common/python_common')
# ------------------------------------------------------------
print ("*** 開始 ***")
#
key_in = sys.argv[1]
print ("%s" % key_in)
#
rr = redis.Redis (host='host_dbase', port=6379, db=0)
#
str_key = str (key_in)
rr.delete (str_key)
#
print ("*** 終了 ***")
#
# ------------------------------------------------------------
