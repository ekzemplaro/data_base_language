#! /usr/bin/jython  
# -*- coding: utf-8 -*-
#
#	json_create.py
#
#					May/27/2015
#
# -------------------------------------------------------------------------
import	sys
import	json
from java.lang import	System
from java.lang import	String
#
#
reload(sys)
sys.setdefaultencoding("utf-8")
#
sys.path.append ('/var/www/data_base/common/jython_common')
from jython_text_manipulate import dict_append_proc
from jython_file_io import file_write_proc
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
#
	dict_aa = dict_append_proc (dict_aa,'t0921','宇都宮',71532,'2004-5-20')
#
	dict_aa = dict_append_proc (dict_aa,'t0922','小山',85746,'2004-4-15')
#
	dict_aa = dict_append_proc (dict_aa,'t0923','佐野',51294,'2004-6-12')
	dict_aa = dict_append_proc (dict_aa,'t0924','足利',57938,'2004-7-21')
	dict_aa = dict_append_proc (dict_aa,'t0925','日光',72681,'2004-4-19')
	dict_aa = dict_append_proc (dict_aa,'t0926','下野',82957,'2004-10-14')
	dict_aa = dict_append_proc (dict_aa,'t0927','さくら',96823,'2004-5-24')
	dict_aa = dict_append_proc (dict_aa,'t0928','矢板',57926,'2004-2-12')
	dict_aa = dict_append_proc (dict_aa,'t0929','真岡',64187,'2004-11-14')
	dict_aa = dict_append_proc (dict_aa,'t0930','栃木',82854,'2004-7-04')
	dict_aa = dict_append_proc (dict_aa,'t0931','大田原',26815,'2004-9-17')
	dict_aa = dict_append_proc (dict_aa,'t0932','鹿沼',23749,'2004-7-20')
	dict_aa = dict_append_proc (dict_aa,'t0933','那須塩原',12759,'2004-3-12')
	dict_aa = dict_append_proc (dict_aa,'t0934','那須烏山',53687,'2003-8-17')
#
	return	dict_aa
#
# -------------------------------------------------------------------------
System.out.println (String ("*** 開始 ***","utf-8"))
#
file_out = sys.argv[1]
#
print	file_out
#
dict_aa = data_prepare_proc ()
#
out_str = json.dumps (dict_aa)
#
#print	out_str
#
file_write_proc (file_out,out_str)
#
System.out.println (String ("*** 終了 ***","utf-8"))
# -------------------------------------------------------------------------
