# -*- coding: utf-8 -*-
#
#	json_create.pyx
#
#				Oct/21/2014
#
import	sys
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
from file_io import file_write_proc
from text_manipulate import dict_append_proc
from text_manipulate import dict_display_proc
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
	dict_aa = dict_append_proc (dict_aa,'t0921','宇都宮',41595,'2003-8-12')
	dict_aa = dict_append_proc (dict_aa,'t0922','小山',38716,'2003-5-15')
	dict_aa = dict_append_proc (dict_aa,'t0923','佐野',51284,'2003-6-12')
	dict_aa = dict_append_proc (dict_aa,'t0924','足利',57638,'2003-7-21')
	dict_aa = dict_append_proc (dict_aa,'t0925','日光',71682,'2003-4-19')
	dict_aa = dict_append_proc (dict_aa,'t0926','下野',82951,'2003-10-14')
	dict_aa = dict_append_proc (dict_aa,'t0927','さくら',96823,'2003-5-24')
	dict_aa = dict_append_proc (dict_aa,'t0928','矢板',57326,'2003-2-12')
	dict_aa = dict_append_proc (dict_aa,'t0929','真岡',64287,'2003-11-14')
	dict_aa = dict_append_proc (dict_aa,'t0930','栃木',82154,'2003-7-04')
	dict_aa = dict_append_proc (dict_aa,'t0931','大田原',72681,'2003-9-17')
	dict_aa = dict_append_proc (dict_aa,'t0932','鹿沼',23549,'2003-7-20')
	dict_aa = dict_append_proc (dict_aa,'t0933','那須塩原',12759,'2003-3-12')
	dict_aa = dict_append_proc (dict_aa,'t0934',u'那須烏山',62531,'2003-8-17')
#
	return	dict_aa
#
# -------------------------------------------------------------------------
print	("*** 開始 ***")
#
#
file_out = sys.argv[1];
#
print	(file_out)
#
dict_aa = data_prepare_proc ()
#
dict_display_proc (dict_aa)
#
out_str = json.dumps (dict_aa)
file_write_proc (file_out,out_str)
#
print	("*** 終了 ***")
# -------------------------------------------------------------------------
