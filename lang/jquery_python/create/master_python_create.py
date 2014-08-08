#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	master_python_read.py
#
#					Jul/25/2014
import	sys
import	string
#
#
# ---------------------------------------------------------------------
def json_str_gen_proc ():
	str_aa='{"cities":[{"id":"921","name":"	横浜","population":"70345","date_mod":"2003-03-02"},'
	str_aa += '{"id":"922","name":"川崎","population":"713450","date_mod":"2003-01-05"},'

	str_aa += '{"id":"923","name":"小田原","population":"76345","date_mod":"2003-01-17"},'

	str_aa += '{"id":"924","name":"藤沢","population":"90345","date_mod":"2003-02-09"},'


	str_aa += '{"id":"925","name":"相模原","population":"90345","date_mod":"2003-02-22"},'

	str_aa += '{"id":"926","name":"厚木","population":"1009345","date_mod":"2003-02-14"}]}'
#
	return	str_aa
# ---------------------------------------------------------------------
#
print "Content-type: text/json\n\n"

json_str = json_str_gen_proc ()
print	json_str
#
