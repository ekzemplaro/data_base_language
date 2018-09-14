#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	mongo_read.py
#
#					Sep/12/2018
import sys
import pymongo
#
sys.path.append ('/var/www/data_base/common/python_common')
from mongo_manipulate import mongo_to_dict_proc
from text_manipulate import dict_display_proc
# -------------------------------------------------------------------
sys.stderr.write ("*** 開始 ***\n")
#
user='scott'
password='tiger123'
client = pymongo.MongoClient(username=user,password=password)
db = client['city']
collection = 'saitama'
#
dict_aa=mongo_to_dict_proc (db,collection)
dict_display_proc (dict_aa)
#
sys.stderr.write ("*** 終了 ***\n")
# -------------------------------------------------------------------
