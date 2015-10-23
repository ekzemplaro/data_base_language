# -*- coding: utf-8 -*-
#
#	excel_create.pyx
#
#						May/31/2012
#
# -------------------------------------------------------------------
import	sys
reload(sys)
sys.setdefaultencoding('utf-8')
sys.path.append ('/var/www/data_base/common/python_common')
from excel_manipulate import excel_write_proc
from text_manipulate import dict_display_proc
from text_manipulate import dict_append_proc

# -------------------------------------------------------------------
def data_prepare_proc ():
	dict_aa = {}
	dict_aa = dict_append_proc (dict_aa,"t2971",u"奈良",72872,"1925-6-12")
	dict_aa = dict_append_proc (dict_aa,"t2972",u"大和高田",81273,"1925-9-15")
	dict_aa = dict_append_proc (dict_aa,"t2973",u"大和郡山",64371,"1925-8-17")
	dict_aa = dict_append_proc (dict_aa,"t2974",u"天理",24674,"1925-2-8")
	dict_aa = dict_append_proc (dict_aa,"t2975",u"橿原",37687,"1925-3-9")
	dict_aa = dict_append_proc (dict_aa,"t2976",u"桜井",83593,"1925-6-26")
	dict_aa = dict_append_proc (dict_aa,"t2977",u"五條",92432,"1925-8-23")
	dict_aa = dict_append_proc (dict_aa,"t2978",u"御所",48765,"1925-10-20")
	dict_aa = dict_append_proc (dict_aa,"t2979",u"生駒",64124,"1925-12-9")
#
	return	dict_aa
# -------------------------------------------------------------------
print   ("*** 開始 ***")
#
excel_file = sys.argv[1]
#
dict_aa = data_prepare_proc ()
print (excel_file)
#
dict_display_proc (dict_aa)
#
excel_write_proc (excel_file,dict_aa)
#
print ("*** 終了 ***")
# -------------------------------------------------------------------
