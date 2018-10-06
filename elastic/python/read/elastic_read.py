#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	elastic_read.py
#
#					Oct/05/2018
#
# ------------------------------------------------------------------
import	sys
import	json
import	requests
#
sys.path.append('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from text_manipulate import dict_append_proc
#
# ------------------------------------------------------------------
sys.stderr.write("*** 開始 ***\n")
#
args = {"q": "*","size": 100}
#
url = "http://localhost:9200/cities/tochigi/_search"
#
rr=requests.get(url,args)
dict_data = json.loads(rr.text)
llx = len(dict_data['hits']['hits'])
sys.stderr.write("llx = %d\n" % llx)
dict_aa = {}
for it in range(llx):
	try:
		ddx = dict_data['hits']['hits'][it]
		key = ddx['_id']
		name = ddx['_source']['name']
		population = ddx['_source']['population']
		date_mod = ddx['_source']['date_mod']
		dict_aa = dict_append_proc(dict_aa,key,name,population,date_mod)
	except Exception as ee:
		sys.stderr.write("*** error ***\n")
		sys.stderr.write(str(ee) + "\n")
#
dict_display_proc(dict_aa)
#
sys.stderr.write("*** 終了 ***\n")
# ------------------------------------------------------------------
