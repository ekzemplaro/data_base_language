# -*- coding: utf-8 -*-
#
#	update/text_update.pyx
#
#					Oct/26/2011
import	sys
import	string
#
# ---------------------------------------------------------------
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import text_read_proc
from text_manipulate import text_write_proc
from text_manipulate import dict_update_proc
from text_manipulate import dict_display_proc
# ---------------------------------------------------------------
#
print ("*** 開始 ***")
#
file_in = sys.argv[1]
id_in = sys.argv[2]
population_in = string.atoi (sys.argv[3])
print ("%s\t%d" % (id_in, population_in))

dict_aa = text_read_proc	(file_in)

dict_bb=dict_update_proc (dict_aa,id_in,population_in)

dict_display_proc	(dict_bb)
text_write_proc (file_in,dict_bb)
#
print ("*** 終了 ***")
# ---------------------------------------------------------------
