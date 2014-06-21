#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	master_python_read.py
#
#					Jun/07/2011
import	sys
import	string
#
#
# ---------------------------------------------------------------------
def json_str_gen_proc ():
	str_aa='{"t0421": {"name":"仙台","population":51345,"date_mod":"2003-3-2"},'
	str_aa += '"t0422": {"name":"石巻","population":42356,"date_mod":"2003-5-15"},'

	str_aa += '"t0423": {"name":"塩竈","population":76391,"date_mod":"2003-1-17"},'

	str_aa += '"t0424": {"name":"気仙沼","population":98342,"date_mod":"2003-2-9"},'

	str_aa += '"t0425": {"name":"白石","population":76343,"date_mod":"2003-12-22"},'
	str_aa += '"t0426": {"name":"名取","population":27342,"date_mod":"2003-10-21"},'
	str_aa += '"t0427": {"name":"多賀城","population":35341,"date_mod":"2003-8-15"},'
	str_aa += '"t0428": {"name":"岩沼","population":64347,"date_mod":"2003-5-17"},'

	str_aa += '"t0429": {"name":"大崎","population":19345,"date_mod":"2003-9-14"}}'
#
	return	str_aa
# ---------------------------------------------------------------------
#
print "Content-type: text/json\n\n"

json_str = json_str_gen_proc ()
print	json_str
#
