#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	data_test.py
#					Jun/03/2018
# ---------------------------------------------------------------
import cgi
import json

# ---------------------------------------------------------------
form = cgi.FieldStorage()
#
message = []
data_in = ""
message.append("start")
#
if "data_in" in form:
	message.append ("*** data_in exist ***")
	data_in = form["data_in"].value
	message.append(data_in)
#
message.append("end")

print("Content-Type: text/json")
print("")
print(json.dumps(message))
# ---------------------------------------------------------------
