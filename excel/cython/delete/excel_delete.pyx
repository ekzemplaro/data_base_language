# -*- coding: utf-8 -*-
#
#	excel_delete.pyx
#
#					Oct/27/2011
import	sys
#
# ---------------------------------------------------------------
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_delete_proc
from excel_manipulate import excel_read_proc
from excel_manipulate import excel_write_proc
# ---------------------------------------------------------------
#
print ("*** 開始 ***")
#
excel_file = sys.argv[1]
id_in = sys.argv[2]
print ("%s" % id_in)

dict_aa = excel_read_proc	(excel_file)

dict_bb = dict_delete_proc (dict_aa,id_in)

excel_write_proc (excel_file,dict_bb)
#
print ("*** 終了 ***")
# ---------------------------------------------------------------
