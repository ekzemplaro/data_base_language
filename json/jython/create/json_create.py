#! /usr/bin/jython  
# -*- coding: utf-8 -*-
#
#	json_create.py
#
#				Jun/20/2012
#
# -------------------------------------------------------------------------
import	sys
import	json
from java.lang import	System
from java.lang import	String
#from java.io import	File,FileWriter,BufferedWriter,PrintWriter
#
reload(sys)
sys.setdefaultencoding("utf-8")
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_append_proc
from file_io import file_write_proc
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
#
	dict_aa = dict_append_proc (dict_aa,'t0921','宇都宮',79532,'2004-5-20')
#
	dict_aa = dict_append_proc (dict_aa,'t0922','小山',85746,'2004-4-15')
#
	dict_aa = dict_append_proc (dict_aa,'t0923','佐野',51294,'2004-6-12')
	dict_aa = dict_append_proc (dict_aa,'t0924',u'足利',57538,'2004-7-21')
	dict_aa = dict_append_proc (dict_aa,'t0925',u'日光',72682,'2004-4-19')
	dict_aa = dict_append_proc (dict_aa,'t0926',u'下野',82951,'2004-10-14')
	dict_aa = dict_append_proc (dict_aa,'t0927',u'さくら',96823,'2004-5-24')
	dict_aa = dict_append_proc (dict_aa,'t0928',u'矢板',57926,'2004-2-12')
	dict_aa = dict_append_proc (dict_aa,'t0929',u'真岡',64187,'2004-11-14')
	dict_aa = dict_append_proc (dict_aa,'t0930',u'栃木',82854,'2004-7-04')
	dict_aa = dict_append_proc (dict_aa,'t0931',u'大田原',26815,'2004-9-17')
	dict_aa = dict_append_proc (dict_aa,'t0932',u'鹿沼',23749,'2004-7-20')
	dict_aa = dict_append_proc (dict_aa,'t0933',u'那須塩原',12759,'2004-3-12')
	dict_aa = dict_append_proc (dict_aa,'t0934',u'那須烏山',53187,'2003-8-17')
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
