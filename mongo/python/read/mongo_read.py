#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	mongo_read.py
#
#					Aug/09/2016
#
import sys
import pymongo
#
sys.path.append ('/var/www/data_base/common/python_common')
from mongo_manipulate import mongo_to_dict_proc
from text_manipulate import dict_display_proc
# -------------------------------------------------------------------
sys.stderr.write ("*** 開始 ***\n")
#
client = pymongo.MongoClient()
db = client['city_db']
#
dict_aa=mongo_to_dict_proc (db)
dict_display_proc (dict_aa)
#
sys.stderr.write ("*** 終了 ***\n")
# -------------------------------------------------------------------
