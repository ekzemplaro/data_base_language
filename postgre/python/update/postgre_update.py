#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	update/postgre_update.py
#
#				May/19/2019
#
# --------------------------------------------------------
import os
import sys
import string
import psycopg2
from dotenv import load_dotenv
#
sys.path.append ('/var/www/data_base/common/python_common')
from sql_manipulate import sql_update_string_gen_proc
#
# --------------------------------------------------------
sys.stderr.write ("*** 開始 ***\n")
key_in = sys.argv[1]
population_in = int (sys.argv[2])
print ("%s\t%d" % (key_in, population_in))
#
dotenv_path = '.env'
load_dotenv(dotenv_path)
USER=os.environ.get("user")
PASSWORD=os.environ.get("user")
DATA_BASE=os.environ.get("data_base")
#
conn = psycopg2.connect("dbname=" + DATA_BASE + " user=" + USER + " password=" + PASSWORD)
#
cur = conn.cursor()
#
sql_str=sql_update_string_gen_proc (key_in,population_in)
cur.execute(sql_str)
conn.commit ()
#
cur.close ()
conn.close ()
#
sys.stderr.write ("*** 終了 ***\n")
#
# --------------------------------------------------------
