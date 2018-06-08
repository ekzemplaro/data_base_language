#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	data_test.py
#					Jun/05/2018
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
if "arg" in form:
	message.append ("*** arg exist ***")
	arg = form["arg"].value
	message.append(arg)
#
if "aa" in form:
	message.append ("*** aa exist ***")
	aa = form["aa"].value
	message.append(aa)
#
if "bb" in form:
	message.append ("*** bb exist ***")
	bb = form["bb"].value
	message.append(bb)
#
if "cc" in form:
	message.append ("*** cc exist ***")
	cc = form["cc"].value
	message.append(cc)
#
if "data_bb" in form:
	message.append ("*** data_bb exist ***")
	data_bb = form["data_bb"].value
	message.append(data_bb)
#
rvalue = {}
message.append("end")
rvalue['message'] = message
print("Content-Type: text/json")
print("")
print(json.dumps(rvalue))
# ---------------------------------------------------------------
