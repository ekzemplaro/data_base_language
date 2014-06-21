#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	firebird_python_read.py
#
#						Mar/04/2010
#
#
import sys
import json
import kinterbasdb
#
sys.path.append ("/var/www/uchida/data_base/python_common")
#
from sql_to_json import sql_to_json_proc
#
fp_out = open ("/tmp/tmp408.txt",'w')
#	
fp_out.write ("*** firebird_python_read.py ***\n")
fp_out.write ("*** check aaa\n")
fp_out.write ("*** check bbb\n")
fp_out.write ("*** check bbb\n")
fp_out.write ("*** check ccc\n")
fp_out.write ("*** jquery_postgre_read.py *** end ***\n")
fp_out.close ()
#
conn = kinterbasdb.connect \
	(dsn='localhost:/var/tmp/firebird/cities.fdb', \
		user="SYSDBA", password="hello9",charset="utf-8")
#
sql_to_json_proc (conn);
conn.close ()
#
