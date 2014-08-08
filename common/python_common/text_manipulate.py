# -*- coding: utf-8 -*-
#
#	text_manipulate.py
#
#					Aug/05/2014
import	sys
import	string
import	datetime
#
from to_utf8 import to_utf8_proc
# ---------------------------------------------------------------
def	text_read_proc	(file_in):
#
	fp_in = open (file_in,encoding='utf-8')
	lines = fp_in.readlines ()
	dict_aa = {}
	for line in lines:
		if (5 < len (line)):
			cols= line[:-1].split ('\t')
			if (3 < len (cols)):
				try:
					if (cols[0][0] == "t"):
						dict_unit = {'name': cols[1], \
			'population':int (cols[2]),'date_mod':cols[3]}
						dict_aa[cols[0]] = dict_unit
				except:
					sys.stderr.write \
				("*** error *** %s ***\n" % file_in)
					sys.stderr.write \
				("*** %s ***\n" % line)
#
	fp_in.close ()
	return	dict_aa
#
# ---------------------------------------------------------------
def	dict_display_proc (dict_aa):
	for key in sorted (dict_aa.keys()):
		if ((key != '_id') and (key != '_rev')):
			unit = dict_aa[key]
			name = unit['name']
			str_out = key+"\t"+ str (name)
			str_out += "\t" + str (unit['population'])
			str_out += "\t" + unit['date_mod']
			print	(str_out)
# ---------------------------------------------------------------
def	text_write_proc	(file_out,dict_aa):
#
	fp_out = open (file_out,mode='w', encoding='utf-8')
	for key in dict_aa.keys():
		unit = dict_aa[key]
		str_out = key + "\t" + str (unit['name']) + "\t"
		str_out += "%d\t" % unit['population']
		str_out += unit['date_mod'] + "\n"
		fp_out.write (str_out)
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
	fp_out = open (file_out,mode='w',encoding='utf-8')
	for key in dict_aa.keys():
		unit = dict_aa[key]
		str_out = key + "," + str (unit['name']) + ","
		str_out += "%d," % unit['population']
		str_out += unit['date_mod'] + "\n"
		fp_out.write (str_out)
#		fp_out.write (str_out.encode ('utf-8'))
	fp_out.close ()
# ---------------------------------------------------------------
def	csv_read_proc	(file_in):
#
	fp_in = open (file_in,encoding='utf-8')
	lines = fp_in.readlines ()
	dict_aa = {}
	for line in lines:
		cols= line[:-1].split (",")
		dict_unit = {'name': cols[1], \
			'population':int (cols[2]),'date_mod':cols[3]}
		dict_aa[cols[0]] = dict_unit
#
	fp_in.close ()
	return	dict_aa
#
# ---------------------------------------------------------------
