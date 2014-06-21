#! /usr/bin/python
# -*- coding: utf-8 -*-
# -------------------------------------------------------------------------
#	json_python_create.py
#
#						Feb/07/2014
# -------------------------------------------------------------------------
import	sys
import	os
import	json
sys.path.append ('/var/www/data_base/common/python_common')
#
from file_io import file_write_proc
from text_manipulate import dict_append_proc
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
#
	dict_aa = {}
	dict_aa = dict_append_proc (dict_aa,'t0921',u'宇都宮',47500,'2003-8-12')
#
	dict_aa = dict_append_proc (dict_aa,'t0922',u'小山',31500,'2003-5-15')
#
	dict_aa = dict_append_proc (dict_aa,'t0923',u'佐野',56400,'2003-6-12')
	dict_aa = dict_append_proc (dict_aa,'t0924',u'足利',57800,'2003-7-21')
	dict_aa = dict_append_proc (dict_aa,'t0925',u'日光',72100,'2003-4-19')
	dict_aa = dict_append_proc (dict_aa,'t0926',u'下野',84900,'2003-10-14')
	dict_aa = dict_append_proc (dict_aa,'t0927',u'さくら',26900,'2003-5-24')
	dict_aa = dict_append_proc (dict_aa,'t0928',u'矢板',53700,'2003-2-12')
	dict_aa = dict_append_proc (dict_aa,'t0929',u'真岡',64800,'2003-11-14')
	dict_aa = dict_append_proc (dict_aa,'t0930',u'栃木',82400,'2003-7-04')
	dict_aa = dict_append_proc (dict_aa,'t0931',u'大田原',72600,'2003-9-17')
	dict_aa = dict_append_proc (dict_aa,'t0932',u'鹿沼',25700,'2003-7-20')
	dict_aa = dict_append_proc (dict_aa,'t0933',u'那須塩原',12900,'2003-3-12')
	dict_aa = dict_append_proc (dict_aa,'t0934',u'那須烏山',62800,'2003-8-17')
#
	return	dict_aa

#
# -------------------------------------------------------------------------
file_out = "/var/tmp/json/cities.json"
#
dict_aa = data_prepare_proc ()
#
out_str = json.dumps (dict_aa)
os.remove (file_out)
file_write_proc (file_out,out_str.encode ('utf-8'))
os.chmod (file_out,0666)
#
print "Content-type: text/html\n\n"
#
print	"*** OK ***<p />"
# -------------------------------------------------------------------------
