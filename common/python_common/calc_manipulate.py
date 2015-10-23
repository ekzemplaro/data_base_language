# -*- coding: utf-8 -*-
#
#	calc_manipulate.py
#
#					Oct/14/2014
#
# -------------------------------------------------------------------
import os
import sys
import ooolib

from to_utf8 import to_utf8_proc
# -------------------------------------------------------------------
def get_cell_value_proc (doc,col,row):
	data = doc.get_cell_value (col,row)
	if (isinstance (data,tuple)):
		dx = data[1].encode ('utf-8')
	else:
		dx = data
#
	return dx
#
# -------------------------------------------------------------------
def calc_read_sheet_proc (dict_aa,doc,cols,rows):
	for row in range (1,rows + 1):
		key = get_cell_value_proc (doc,1,row)
		name = get_cell_value_proc (doc,2,row)
		population = get_cell_value_proc (doc,3,row)
		date_mod = get_cell_value_proc (doc,4,row)
		dict_unit = {'name': name, \
				'population': population,'date_mod': date_mod}
		dict_aa [key] = dict_unit

#
	return dict_aa
# -------------------------------------------------------------------
def calc_read_proc (file_calc):
	dict_aa = {}
	doc = ooolib.Calc(opendoc=file_calc)
#
	count = doc.get_sheet_count()
	for cc in range (0,count):
		doc.set_sheet_index (cc)
		name = doc.get_sheet_name()
#		print "Sheet Name: %s" % name
		(cols, rows) = doc.get_sheet_dimensions()
		if (0 < rows):
			dict_aa = calc_read_sheet_proc (dict_aa,doc,cols,rows)
	return	dict_aa
# -------------------------------------------------------------------
def calc_write_proc (calc_file,dict_aa):
	doc = ooolib.Calc()
	row = 1
	for key in sorted (dict_aa.keys()):
		unit = dict_aa[key]
		doc.set_cell_value (1,row,"int", key)
#		doc.set_cell_value (2,row,"string", unit['name'])
#		doc.set_cell_value (2,row,"string", unit['name'].encode ('utf-8'))
#		name_utf8 = to_utf8_proc(unit['name'])
		name_utf8 = unit['name']
		doc.set_cell_value (2,row,"string", name_utf8)
		doc.set_cell_value (3,row,"int", unit['population'])
		doc.set_cell_value (4,row,"string", unit['date_mod'])
#
#
		row += 1
#
	doc.save (calc_file)
	os.chmod (calc_file,0o666)
#
# -------------------------------------------------------------------
