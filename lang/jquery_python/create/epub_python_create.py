#! /usr/bin/python
# -*- coding: utf-8 -*-
# -------------------------------------------------------------------------
#	epub_python_create.py
#
#						May/09/2013
# -------------------------------------------------------------------------
import	sys
reload(sys)
sys.setdefaultencoding('utf-8')
import	json
sys.path.append ('/var/www/data_base/common/python_common')
#
from epub_manipulate import dict_to_epub_proc
from text_manipulate import dict_append_proc
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
#
	dict_aa = dict_append_proc (dict_aa,'t1931',u'甲府',82400,'2003-5-8')
	dict_aa = dict_append_proc (dict_aa,'t1932',u'富士吉田',72800,'2003-7-12')
	dict_aa = dict_append_proc (dict_aa,'t1933',u'都留',79500,'2003-2-14')
	dict_aa = dict_append_proc (dict_aa,'t1934',u'山梨',67300,'2003-4-9')
	dict_aa = dict_append_proc (dict_aa,'t1935',u'大月',43100,'2003-6-4')
	dict_aa = dict_append_proc (dict_aa,'t1936',u'韮崎',18700,'2003-10-21')
	dict_aa = dict_append_proc (dict_aa,'t1937',u'南アルプス',81600,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t1938',u'北杜',43500,'2003-8-26')
	dict_aa = dict_append_proc (dict_aa,'t1939',u'甲斐',82100,'2003-11-15')
#
	return	dict_aa
#
# -------------------------------------------------------------------------
print "Content-type: text/html\n\n"
#
dict_aa = data_prepare_proc ()
#
file_epub = "/var/tmp/epub/cities.epub"
dict_to_epub_proc (file_epub,dict_aa)
#
#
#
print	"*** OK ***<p />"
# -------------------------------------------------------------------------
