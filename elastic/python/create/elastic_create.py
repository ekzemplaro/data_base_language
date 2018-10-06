#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	elastic_create.py
#
#					Oct/05/2018
#
import	sys
import	json
import	requests
#
# -------------------------------------------------------------------------
sys.path.append('/var/www/data_base/common/python_common')
from text_manipulate import dict_append_proc
#
# -------------------------------------------------------------------------
def	data_prepare_proc():
	dict_aa = {}
	dict_aa = dict_append_proc(dict_aa,'t0921','宇都宮',48291,'2003-7-15')
	dict_aa = dict_append_proc(dict_aa,'t0922','小山',31759,'2003-5-18')
	dict_aa = dict_append_proc(dict_aa,'t0923','佐野',75214,'2003-6-9')
	dict_aa = dict_append_proc(dict_aa,'t0924','足利',29138,'2003-7-24')
	dict_aa = dict_append_proc(dict_aa,'t0925','日光',73612,'2003-8-11')
	dict_aa = dict_append_proc(dict_aa,'t0926','下野',82951,'2003-10-14')
	dict_aa = dict_append_proc(dict_aa,'t0927','さくら',94823,'2003-5-24')
	dict_aa = dict_append_proc(dict_aa,'t0928','矢板',57916,'2003-2-12')
	dict_aa = dict_append_proc(dict_aa,'t0929','真岡',64257,'2003-11-14')
	dict_aa = dict_append_proc(dict_aa,'t0930','栃木',82154,'2003-7-04')
	dict_aa = dict_append_proc(dict_aa,'t0931','大田原',72981,'2003-9-17')
	dict_aa = dict_append_proc(dict_aa,'t0932','鹿沼',28149,'2003-7-20')
	dict_aa = dict_append_proc(dict_aa,'t0933','那須塩原',72359,'2003-3-12')
	dict_aa = dict_append_proc (dict_aa,'t0934','那須烏山',61538,'2003-8-17')
#
	return	dict_aa
#
# -------------------------------------------------------------------------
sys.stderr.write("*** 開始 ***\n")
#
dict_aa = data_prepare_proc()
#
url_base = "http://localhost:9200/cities/tochigi"
#
for key in dict_aa.keys():
	unit_aa = dict_aa[key]
	json_str = json.dumps(unit_aa)
	url = url_base + "/" + key
	print(url)
	headers = {'content-type': 'application/json'}
	rr=requests.put(url,data=json_str,headers=headers)
	print(rr)
#
sys.stderr.write("*** 終了 ***\n")
# -------------------------------------------------------------------------
