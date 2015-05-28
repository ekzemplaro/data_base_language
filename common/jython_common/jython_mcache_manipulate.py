# -*- coding: utf-8 -*-
#
#	jython_mcache_manipulate.py
#
#					May/28/2015
import	sys
import	string
import	socket
import	json
from time import localtime,strftime
#
# ---------------------------------------------------------------
def get_record_proc (ss,key_id):
	command = "get " + key_id + "\n"
	ss.send(command)
	data = ss.recv(1024)
	if (6 < len (data)):
		lines = data.split ("\n")
		json_str = lines[1]
#
		unit_aa = json.loads (json_str)
		print ("%s\t%s\t%d\t%s" %  (key_id,unit_aa.get ("name"), \
			unit_aa.get ("population"), \
			unit_aa.get ("date_mod")))
#
# ---------------------------------------------------------------
def mcached_update_proc (ss,key_in,population_in):
	command = "get " + key_in + "\n"
	ss.send(command)
	data = ss.recv(1024)
	print data
	if (6 < len (data)):
		lines = string.split (data,"\n")
		json_str = lines[1]
		unit_aa = json.loads (json_str)
		print ("%s\t%s\t%d\t%s" %  (key_in,unit_aa['name'], \
			unit_aa['population'],unit_aa['date_mod']))
		unit_aa['population'] = population_in
		today = strftime ("%Y-%m-%d",localtime ())
		unit_aa['date_mod'] = today
		json_str_new = json.dumps (unit_aa)
#
		mcache_set_proc (ss,key_in,json_str_new)
#
# ---------------------------------------------------------------
def mcache_set_proc (ss,key_in,json_str):
	llx = len (json_str);
	command = "set " + key_in + (" 0 0 %d" % llx) + "\r\n"
	command += json_str + "\r\n"
#
	ss.send(command)
	data = ss.recv(1024)
#	print data
# ---------------------------------------------------------------
def delete_record_proc (ss,key_id):
	command = "delete " + key_id + "\n"
	ss.send(command)
	data = ss.recv(1024)
	lines = string.split (data)
	print (lines[0])
# ---------------------------------------------------------------
