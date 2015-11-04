#! /usr/bin/python
# -*- coding: utf-8 -*-
#
# --------------------------------------------------------------------
import	os
import	sys
import	json
import	time
# --------------------------------------------------------------------
folder_in = 'work_area'
files = os.listdir (folder_in)

data_out = {}
for file in files:
	llx = len (file)
	if (4 < llx):
		if file[llx-4:] == '.zip':
			path_aa = folder_in + '/' + file
			size = os.path.getsize (path_aa)
			ctime = os.path.getctime (path_aa)
			localtime = time.localtime (ctime)
			tstr = time.strftime('%Y/%m/%d %H:%M',localtime)
			unit_aa = {}
			unit_aa['size'] = size
			unit_aa['date'] = tstr
			data_out[file]= unit_aa
#
str_aa = json.dumps (data_out)

print ("Content-type: text/json; charset=UTF-8\n\n")
print (str_aa) 
# --------------------------------------------------------------------


