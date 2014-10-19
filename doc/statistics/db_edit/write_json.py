#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	write_json.py
#
#					Oct/16/2014
#
import	sys
import	cgi
import	json
# ------------------------------------------------------------------
message = []
form = cgi.FieldStorage()
file_json = ""
data_out = ""
#
if "file" in form:
	message.append ("*** file exist ***")
	file_json = form["file"].value
	message.append (file_json)
#
if "data_out" in form:
	message.append ("*** data_out exist ***")
	data_out = form["data_out"].value
#
fp_out = open (file_json,mode='w', encoding='utf-8')
fp_out.write (data_out)
fp_out.close ()
#
#$file_json = $_POST["file"];
#$textfile = fopen($file_json, "w");
#fputs($textfile, $_POST["data_out"]);
#fclose($textfile);

message.append ("*** OK ***")


result = {}
result['message'] = message
result['file_json'] = file_json

str_json = json.dumps (result)
#
print ("Content-Type: application/json\n\n")
#
#
print	(str_json)
# ------------------------------------------------------------------
