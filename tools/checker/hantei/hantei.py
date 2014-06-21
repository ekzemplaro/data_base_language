#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	hantei.py
#
#						Oct/10/2010
#
import	sys
import	string
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import text_read_proc
from text_manipulate import dict_display_proc

# --------------------------------------------------------------------
def hantei_proc (dict_aa,dict_bb,dict_cc,dict_dd):
	hantei = True
	len_aa = len (dict_aa)
	len_bb = len (dict_bb)
	len_cc = len (dict_cc)
	if (len_aa < 9):
		hantei = False
		print ("*** error *** len_aa = %d" % len_aa)
	elif (len_aa != len_bb):
		hantei = False
		print ("*** error *** len_aa != len_bb")
	elif (dict_aa == dict_bb):
		hantei = False
		print ("*** error *** dict_aa == dict_bb")
	elif ((len_bb - len_cc) != 1):
		hantei = False
		print ("*** error *** len_cc = %d" % len_cc)
	elif (dict_aa != dict_dd):
		hantei = False
		print ("*** error *** dict_aa != dict_dd")
#
	return	hantei
#
# --------------------------------------------------------------------
#sys.stderr.write ("*** 開始 ***\n")
dbase = sys.argv[1]
lang = sys.argv[2]
file_aa = sys.argv[3]
file_bb = sys.argv[4]
file_cc = sys.argv[5]
file_dd = sys.argv[6]
#
dict_aa = text_read_proc (file_aa)
dict_bb = text_read_proc (file_bb)
dict_cc = text_read_proc (file_cc)
dict_dd = text_read_proc (file_dd)
#
hantei = hantei_proc (dict_aa,dict_bb,dict_cc,dict_dd)
#
print ("%s\t%s\t%s" % (dbase,lang,hantei))
if (hantei == False):
	print dict_aa.keys ()
	print dict_bb.keys ()
	print dict_cc.keys ()
	print dict_dd.keys ()
	print ("*** error *** ")
#
#sys.stderr.write ("*** 終了 ***\n")
# --------------------------------------------------------------------

