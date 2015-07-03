# -*- coding: utf-8 -*-
#
#	xlsx_delete.pyx
#
#					Jul/03/2015
import	sys
#
# ---------------------------------------------------------------
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_delete_proc
from xlsx_manipulate import xlsx_read_proc
from xlsx_manipulate import xlsx_write_proc
# ---------------------------------------------------------------
#
print ("*** 開始 ***")
#
xlsx_file = sys.argv[1]
key = sys.argv[2]
print ("%s" % key)

dict_aa = xlsx_read_proc	(xlsx_file)

dict_bb = dict_delete_proc (dict_aa,key)

xlsx_write_proc (xlsx_file,dict_bb)
#
print ("*** 終了 ***")
# ---------------------------------------------------------------
