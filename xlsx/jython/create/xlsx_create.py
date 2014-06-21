#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	xlsx_create.py
#					Aug/07/2013
#
# ----------------------------------------------------------------
import	sys
#
# ----------------------------------------------------------------
sys.path.append ('/var/www/data_base/common/python_common')
sys.path.append ('/var/www/data_base/common/jython_common')
from text_manipulate import dict_append_proc
from jython_text_manipulate import jython_dict_display_proc
from jython_xlsx_manipulate import jython_xlsx_write_proc
# ----------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t2971',u'奈良',29174,'2004-7-21')
	dict_aa = dict_append_proc (dict_aa,'t2972',u'大和高田',67825,'2004-8-12')
	dict_aa = dict_append_proc (dict_aa,'t2973',u'大和郡山',72614,'2004-9-17')
	dict_aa = dict_append_proc (dict_aa,'t2974',u'天理',61482,'2004-2-9')
	dict_aa = dict_append_proc (dict_aa,'t2975',u'橿原',73512,'2004-3-15')
	dict_aa = dict_append_proc (dict_aa,'t2976',u'桜井',35187,'2004-1-21')
	dict_aa = dict_append_proc (dict_aa,'t2977',u'五條',81256,'2004-7-23')
	dict_aa = dict_append_proc (dict_aa,'t2978',u'御所',23784,'2004-10-26')
	dict_aa = dict_append_proc (dict_aa,'t2979',u'生駒',45823,'2004-12-15')
#
	return	dict_aa
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
xlsx_file = sys.argv[1]
#
dict_aa = data_prepare_proc ()
#
jython_dict_display_proc (dict_aa)
#
jython_xlsx_write_proc (xlsx_file,dict_aa)
#
print ("*** 終了 ***")
#
# ----------------------------------------------------------------
