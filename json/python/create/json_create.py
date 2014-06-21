#! /usr/bin/python  
# -*- coding: utf-8 -*-
#
#	json_create.py
#
#					Feb/07/2014
#
import	sys
reload(sys)
sys.setdefaultencoding('utf-8')
import	os
import	json
#
# -------------------------------------------------------------------------
sys.path.append ('/var/www/data_base/common/python_common')
from file_io import file_write_proc
from text_manipulate import dict_append_proc
from text_manipulate import dict_display_proc
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
	dict_aa = dict_append_proc (dict_aa,'t0921',u'宇都宮',41295,'2003-8-12')
#
	dict_aa = dict_append_proc (dict_aa,'t0922',u'小山',38756,'2003-5-15')
#
	dict_aa = dict_append_proc (dict_aa,'t0923',u'佐野',51294,'2003-6-8')
	dict_aa = dict_append_proc (dict_aa,'t0924',u'足利',57138,'2003-7-21')
	dict_aa = dict_append_proc (dict_aa,'t0925',u'日光',74682,'2003-4-19')
	dict_aa = dict_append_proc (dict_aa,'t0926',u'下野',82951,'2003-10-14')
	dict_aa = dict_append_proc (dict_aa,'t0927',u'さくら',96823,'2003-5-24')
	dict_aa = dict_append_proc (dict_aa,'t0928',u'矢板',57926,'2003-2-12')
	dict_aa = dict_append_proc (dict_aa,'t0929',u'真岡',64187,'2003-11-14')
	dict_aa = dict_append_proc (dict_aa,'t0930',u'栃木',82354,'2003-7-04')
	dict_aa = dict_append_proc (dict_aa,'t0931',u'大田原',72681,'2003-9-17')
	dict_aa = dict_append_proc (dict_aa,'t0932',u'鹿沼',23749,'2003-7-20')
	dict_aa = dict_append_proc (dict_aa,'t0933',u'那須塩原',12759,'2003-3-12')
	dict_aa = dict_append_proc (dict_aa,'t0934',u'那須烏山',62531,'2003-8-17')
#
	return	dict_aa
#
# -------------------------------------------------------------------------
print	("*** 開始 ***")
#
#
file_out = sys.argv[1]
#
print	file_out
#
dict_aa = data_prepare_proc ()
#
dict_display_proc (dict_aa)
#
os.remove (file_out)
out_str = json.dumps (dict_aa)
file_write_proc (file_out,out_str.encode ('utf-8'))
os.chmod (file_out,0666)
#
print	("*** 終了 ***")
# -------------------------------------------------------------------------
