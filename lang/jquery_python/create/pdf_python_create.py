#! /usr/bin/python
# -*- coding: utf-8 -*-
# -------------------------------------------------------------------------
#	pdf_python_create.py
#
#						Jul/10/2012
# -------------------------------------------------------------------------
import	sys
reload(sys)
sys.setdefaultencoding('utf-8')
import	json
sys.path.append ('/var/www/data_base/common/python_common')
#
from pdf_manipulate import dict_to_pdf_proc
from text_manipulate import dict_append_proc
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
#
	dict_aa = dict_append_proc (dict_aa,'t2531',u'大津',94500,'2003-5-8')
	dict_aa = dict_append_proc (dict_aa,'t2532',u'草津',38200,'2003-7-15')
	dict_aa = dict_append_proc (dict_aa,'t2533',u'守山',27400,'2003-2-14')
	dict_aa = dict_append_proc (dict_aa,'t2534',u'栗東',61500,'2003-7-9')
	dict_aa = dict_append_proc (dict_aa,'t2535',u'野洲',42900,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t2536',u'甲賀',35700,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t2537',u'湖南',85600,'2003-10-23')
	dict_aa = dict_append_proc (dict_aa,'t2538',u'近江八幡',28100,'2003-8-26')
	dict_aa = dict_append_proc (dict_aa,'t2539',u'彦根',75300,'2003-9-15')
#
	return	dict_aa
#
# -------------------------------------------------------------------------
print "Content-type: text/html\n\n"
#
dict_aa = data_prepare_proc ()
#
file_pdf = "/var/tmp/pdf/cities.pdf"
dict_to_pdf_proc (file_pdf,dict_aa)
#
#
#
print	"*** OK ***<p />"
# -------------------------------------------------------------------------
