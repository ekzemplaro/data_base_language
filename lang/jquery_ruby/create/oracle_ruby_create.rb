#! /usr/bin/python
#!/usr/bin/env ORACLE_HOME=/usr/lib/oracle/xe/app/oracle/product/10.2.0/client python
#
# -*- coding: utf-8 -*-
#
#	read/oracle_python_read.py
#
#						Mar/22/2010
#
#
#
import sys
import json
import cx_Oracle
#
#
sys.path.append ("/var/www/uchida/data_base/python_common")
#
from sql_to_json import sql_to_json_proc
#
conn = cx_Oracle.connect ("system/hello9@cpt003:1521/xe")
#
sql_to_json_proc (conn);
conn.close ()
#
#	
#
