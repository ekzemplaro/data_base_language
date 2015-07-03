#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	pick_up.py
#
#						Jun/25/2015
#
import	sys
import	json
#
from bs4 import BeautifulSoup
#
# --------------------------------------------------------------------
sys.path.append ('/var/www/data_base/common/python_common')
from file_io import file_write_proc
# --------------------------------------------------------------------
print ("*** 開始 ***")
file_in = sys.argv[1]
json_out = sys.argv[2]
#
soup = BeautifulSoup(open (file_in))
#
print (soup.title)
# print (soup.table)

table = soup.find("table", { "class" : "list" })
array_out = []
for row in table.findAll("tr"):
	cells = row.findAll("td")
	array_record = []
	for it in range (len (cells)):
		data = str (cells[it].contents)
		data = data.replace ("<br/>","")
		data = data.replace ("\\u3000","　")
		data = data.replace ("<font color=\"red\">","'")
		data = data.replace ("<font color=\"blue\">","'")
		data = data.replace ("</font>","'")
		array_record.append (data)
#		array_record.append (cells[it].string)
#		array_record.append (cells[it].text)
	array_out.append (array_record)
#
#
out_str = json.dumps (array_out)
file_write_proc (json_out,out_str)
print ("*** 終了 ***")
# --------------------------------------------------------------------
#
