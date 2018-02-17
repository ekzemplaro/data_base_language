# -*- coding: utf-8 -*-
#
#	text_manipulate.py
#
#					Feb/17/2018
# ---------------------------------------------------------------
import	sys
import	csv
import	string
import	datetime
#
# ---------------------------------------------------------------
def	text_read_proc(file_in):
#
	fp_in = open(file_in,encoding='utf-8')
	lines = fp_in.readlines()
	fp_in.close()
#
	dict_aa = {}
	for line in lines:
		if (5 < len(line)):
			cols= line[:-1].split ('\t')
			if (3 < len(cols)):
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
	return	dict_aa
#
# ---------------------------------------------------------------
def dict_display_proc(dict_aa):
	for key in sorted(dict_aa.keys()):
		if ((key != '_id') and (key != '_rev')):
			unit = dict_aa[key]
			name = unit['name']
#			str_out = key+"\t"+ str(name)
			str_out = str(key) +"\t"+ str(name)
			str_out += "\t" + str(unit['population'])
			str_out += "\t" + str(unit['date_mod'])
			print(str_out)
# ---------------------------------------------------------------
def	text_write_proc(file_out,dict_aa):
#
	fp_out = open(file_out,mode='w', encoding='utf-8')
	for key in dict_aa.keys():
		unit = dict_aa[key]
		str_out = key + "\t" + str(unit['name']) + "\t"
		str_out += "%d\t" % unit['population']
		str_out += unit['date_mod'] + "\n"
		fp_out.write(str_out)
	fp_out.close()
# ---------------------------------------------------------------
def	dict_update_proc(dict_in,id,population):
	key = str(id)
	if key in dict_in:
		dict_in[key]['population'] = population
		date_mod = datetime.date.today()
		dict_in[key]['date_mod'] = '%s' % date_mod
#
	return	dict_in
#
# ---------------------------------------------------------------
def	dict_delete_proc(dict_in,key):
	if key in dict_in:
		del dict_in[key]
#
	return	dict_in
#
# ---------------------------------------------------------------
def	hash_update_proc(array_unit,population):
	date_mod = datetime.date.today()
	array_unit['population'] = population
	array_unit['date_mod'] = '%s' % date_mod
# ---------------------------------------------------------------
def     dict_append_proc(dict_aa,key,name,population,date_mod):
	dict_aa[key] = {'name':name,'population':population,'date_mod':date_mod}
#
	return dict_aa
#
# ---------------------------------------------------------------
def	csv_write_proc(file_csv,dict_aa):
	ff = open(file_csv,'w')
	writer = csv.writer(ff, lineterminator='\n')
	for key in dict_aa.keys():
		array_aa = []
		unit = dict_aa[key]
		pp = "%d" % unit['population']
#
		array_aa.append(key)
		array_aa.append(str(unit['name']))
		array_aa.append(pp)
		array_aa.append(unit['date_mod'])
		writer.writerow(array_aa)
#
	ff.close()
#
# ---------------------------------------------------------------
def	csv_read_proc(file_csv):
#
	fp = open(file_csv, 'r')
	reader = csv.reader(fp)
	dict_aa = {}
	for row in reader:
		dict_unit = {'name': row[1], \
			'population':int (row[2]),'date_mod':row[3]}
		dict_aa[row[0]] = dict_unit
#
	fp.close()
#
	return	dict_aa
#
# ---------------------------------------------------------------
