# -*- coding: utf-8 -*-
#
#	excel_manipulate.py
#
#						Sep/05/2014
#
# -------------------------------------------------------------------
import sys
import string
import xlrd
import xlwt

# -------------------------------------------------------------------
def excel_read_proc (excel_file):
	dict_aa = {} 
#
	book = xlrd.open_workbook(excel_file)
#
	sheet_1 = book.sheet_by_index(0)
#
	for row in range(sheet_1.nrows):
		for col in range(sheet_1.ncols):
			key = sheet_1.cell(row,0).value
			name = sheet_1.cell(row,1).value
			population = int (sheet_1.cell(row,2).value)
			date_mod = sheet_1.cell(row,3).value
			dict_unit = {'name': name, \
				'population':population,'date_mod':date_mod}
			dict_aa [key] = dict_unit
#
	return	dict_aa
#
# -------------------------------------------------------------------
def excel_data_create_proc (ws,row,key,unit):
	ws.write(row,0,key)
	ws.write(row,1,unit['name'])
	ws.write(row,2,unit['population'])
	ws.write(row,3,unit['date_mod'])
# -------------------------------------------------------------------
def excel_write_proc (excel_file,dict_aa):
	wb = xlwt.Workbook()
	ws = wb.add_sheet ('Cities')
#
	irow = 0
	for key in dict_aa.keys():
		excel_data_create_proc (ws,irow,key,dict_aa[key])
		irow += 1

	wb.save (excel_file)
# -------------------------------------------------------------------
