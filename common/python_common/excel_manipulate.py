#!/usr/bin/python
# -*- coding: utf-8 -*-
#
#	excel_manipulate.py
#
#						May/30/2012
#
# -------------------------------------------------------------------
from pyExcelerator import *
import sys
import string

# -------------------------------------------------------------------
def excel_read_proc (excel_file):
	dict_aa = {} 
	for sheet_name, values in parse_xls (excel_file, 'utf-8'):
#		print 'Sheet = "%s"' % sheet_name
#		print 'length = %d' % len(values)
		maxcols = 0
		maxrows = 0
		for row,col in values.keys():
			if col > maxcols: maxcols = col
			if row > maxrows: maxrows = row
#		print "maxcols = %d" % maxcols
#		print "maxrows = %d" % maxrows
#
		for row_idx in range (maxrows + 1):
			vv = []
			for col_idx in range (4):
				vv.append (values[(row_idx, col_idx)])
#
			key = vv[0]
			dict_unit = {'name': vv[1], \
				'population':int (vv[2]),'date_mod':vv[3]}
			dict_aa [key] = dict_unit
#
	return	dict_aa
#
# -------------------------------------------------------------------
def excel_data_create_proc (ws,row,id,name,population,date_mod):
	ws.write(row,0,id)
	ws.write(row,1,name)
	ws.write(row,2,population)
	ws.write(row,3,date_mod)
# -------------------------------------------------------------------
def excel_write_proc (excel_file,dict_aa):
	w = Workbook()
	ws = w.add_sheet ('Cities')
#
	irow = 0
	for key in dict_aa.keys():
		unit = dict_aa[key]
#		print	unit['name'],unit['population']
		excel_data_create_proc (ws,irow,key,unit['name'],unit['population'],unit['date_mod'])
		irow += 1

	w.save (excel_file)
# -------------------------------------------------------------------
