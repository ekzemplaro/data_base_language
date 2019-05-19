#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	postgre_read.py
#					May/19/2019
#
# --------------------------------------------------------
import os
import sys
import psycopg2
import psycopg2.extras
from dotenv import load_dotenv

sys.path.append ('/var/www/data_base/common/python_common')
from sql_manipulate import sql_to_dict_proc
from text_manipulate import dict_display_proc
#
sys.stderr.write ("*** 開始 ***\n")
dotenv_path = '.env'
load_dotenv(dotenv_path)
USER=os.environ.get("user")
PASSWORD=os.environ.get("user")
DATA_BASE=os.environ.get("data_base")
#
conn = psycopg2.connect("dbname=" + DATA_BASE + " user=" + USER + " password=" + PASSWORD)
cur = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
#
dict_aa = sql_to_dict_proc (cur)
#
cur.close()
conn.close()

dict_display_proc (dict_aa)
#
sys.stderr.write ("*** 終了 ***\n")
#
# --------------------------------------------------------
