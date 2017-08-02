#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	maria_update.py
#
#					Jul/31/2017
#
# --------------------------------------------------------
import	sys
import	string
import	mysql.connector
#
sys.path.append('../../../common/python_common')
from sql_manipulate import sql_update_proc
#
# --------------------------------------------------------
sys.stderr.write("*** 開始 ***\n")
#
key_in = sys.argv[1]
population_in = int(sys.argv[2])
print("%s\t%d" % (key_in, population_in))
#
#
host_aa='localhost'
data_base = 'city'
user_aa ='scott'
password_aa = 'tiger123'
conn = mysql.connector.connect(user=user_aa, password=password_aa, \
                              host=host_aa,database=data_base)
#
cursor = conn.cursor()
#
sql_update_proc(cursor,key_in,population_in)
#
conn.commit()
cursor.close()
conn.close()
#
sys.stderr.write("*** 終了 ***\n")
#
# --------------------------------------------------------
