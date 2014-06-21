# -*- coding: utf-8 -*-
#
#	text_manipulate.py
#
#					Mar/28/2014
import	sys
import	string
import	datetime
#
from to_utf8 import to_utf8_proc
# ---------------------------------------------------------------
def	text_read_proc	(file_in):
#
	fp_in = open (file_in,"r")
	lines = fp_in.readlines ()
	dict_aa = {}
	for line in lines:
		if (5 < len (line)):
			cols= string.split (line)
			if (cols[0][0] == "t"):
				dict_unit = {'name': cols[1], \
			'population':string.atoi (cols[2]),'date_mod':cols[3]}
				dict_aa[cols[0]] = dict_unit
#
	fp_in.close ()
	return	dict_aa
#
# ---------------------------------------------------------------
def	dict_display_proc (dict_aa):
	for key in sorted (dict_aa.keys()):
		if ((key != '_id') and (key != '_rev')):
			unit = dict_aa[key]
#			name = unit['name'].encode ("utf-8")
			name = unit['name']
#			name = to_utf8_proc (unit['name'])
#			str_out = (key+"\t"+unit['name']+"\t").encode ("utf-8")
#			str_out = (key+"\t"+ name +"\t")
#			print	str_out,
			print	key,"\t",
			print	name,"\t",
			print	unit['population'],"\t",unit['date_mod']
# ---------------------------------------------------------------
def	text_write_proc	(file_out,dict_aa):
#
	fp_out = open (file_out,'w')
	for key in dict_aa.keys():
		unit = dict_aa[key]
		str_out = key + "\t" + unit['name'] + "\t"
		str_out += "%d\t" % unit['population']
		str_out += unit['date_mod'] + "\n"
		fp_out.write (str_out)
#		fp_out.write (str_out.encode ('utf-8'))
	fp_out.close ()
# ---------------------------------------------------------------
def	dict_update_proc (dict_in,id,population):
	key = str (id)
	if key in dict_in:
		dict_in[key]['population'] = population
		date_mod = datetime.date.today ()
		dict_in[key]['date_mod'] = '%s' % date_mod
#
	return	dict_in
#
# ---------------------------------------------------------------
def	dict_delete_proc (dict_in,key):
	if key in dict_in:
		del dict_in[key]
#
	return	dict_in
#
# ---------------------------------------------------------------
def	hash_update_proc (array_unit,population):
	date_mod = datetime.date.today ()
	array_unit['population'] = population
	array_unit['date_mod'] = '%s' % date_mod
# ---------------------------------------------------------------
def     dict_append_proc (dict_aa,key,name,population,date_mod):
	dict_aa[key] = {'name':name,'population':population,'date_mod':date_mod}
#	dict_aa[key] = {'name':name.encode ('utf-8'),'population':population,'date_mod':date_mod}
#
	return dict_aa
#
# ---------------------------------------------------------------
def	csv_write_proc	(file_out,dict_aa):
#
	fp_out = open (file_out,'w')
	for key in dict_aa.keys():
		unit = dict_aa[key]
		str_out = key + "," + unit['name'] + ","
		str_out += "%d," % unit['population']
		str_out += unit['date_mod'] + "\n"
		fp_out.write (str_out)
#		fp_out.write (str_out.encode ('utf-8'))
	fp_out.close ()
# ---------------------------------------------------------------
def	csv_read_proc	(file_in):
#
	fp_in = open (file_in,"r")
	lines = fp_in.readlines ()
	dict_aa = {}
	for line in lines:
		cols= string.split (line[:-1],",")
		dict_unit = {'name': cols[1], \
			'population':string.atoi (cols[2]),'date_mod':cols[3]}
		dict_aa[cols[0]] = dict_unit
#
	fp_in.close ()
	return	dict_aa
#
# ---------------------------------------------------------------
