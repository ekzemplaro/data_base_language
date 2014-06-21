#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	notyet_python_read.py
#
#					Dec/15/2010
import	sys
import	string
#
#
# ---------------------------------------------------------------------
def json_str_gen_proc ():
	str_aa='{"cities":[{"id":921,"name":"横浜","population":51345,"date_mod":"2003-3-2"},'
	str_aa += '{"id":922,"name":"川崎","population":42356,"date_mod":"2003-5-15"},'

	str_aa += '{"id":923,"name":"小田原","population":76391,"date_mod":"2003-1-17"},'

	str_aa += '{"id":924,"name":"藤沢","population":98342,"date_mod":"2003-2-9"},'

	str_aa += '{"id":925,"name":"相模原","population":76343,"date_mod":"2003-12-22"},'
	str_aa += '{"id":926,"name":"厚木","population":27342,"date_mod":"2003-10-21"},'
	str_aa += '{"id":927,"name":"横須賀","population":35341,"date_mod":"2003-8-15"},'
	str_aa += '{"id":928,"name":"鎌倉","population":64347,"date_mod":"2003-5-17"},'

	str_aa += '{"id":"929","name":"逗子","population":19345,"date_mod":"2003-9-14"}]}'
#
	return	str_aa
# ---------------------------------------------------------------------
#
print "Content-type: text/json\n\n"

json_str = json_str_gen_proc ()
print	json_str
#
