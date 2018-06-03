#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	data_test.py
#					Jun/03/2018
# ---------------------------------------------------------------
import cgi

# ---------------------------------------------------------------
form = cgi.FieldStorage()
#
message = []
data_in = ""
#
if "data_in" in form:
	message.append ("*** data_in exist ***")
	data_in = form["data_in"].value

print("Content-Type: text/plain")
print("")
print("data_in = " + data_in)
# ---------------------------------------------------------------
