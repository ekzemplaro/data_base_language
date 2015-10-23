#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	jython_excel_manipulate.py
#					Aug/08/2013
#
# ----------------------------------------------------------------
#
import	sys
import	string
#
from 	java.io import FileInputStream
from 	java.io import FileOutputStream
from 	org.apache.poi.hssf.usermodel import HSSFWorkbook
from 	org.apache.poi.ss.usermodel import Row
from 	org.apache.poi.ss.usermodel import Cell
#
# ----------------------------------------------------------------
sys.path.append ('/var/www/data_base/common/python_common')
sys.path.append ('/var/www/data_base/common/jython_common')
from text_manipulate import dict_append_proc
from jython_text_manipulate import jython_dict_display_proc
# ----------------------------------------------------------------
def jython_excel_read_proc (excel_file):
	print ("*** excel_read_proc ***")
#
	dict_aa = {}
	fi=FileInputStream (excel_file)
	wb = HSSFWorkbook (fi)
	fi.close()
#
	sheet = wb.getSheetAt(0)
	print ("--- "+ sheet.getSheetName()+" ---")
	sheet.setForceFormulaRecalculation (True)
	for row in range (9):
		rr = sheet.getRow (row)
		if (rr != None):
			key = rr.getCell (0,Row.RETURN_BLANK_AS_NULL).getStringCellValue ()
			name = rr.getCell (1,Row.RETURN_BLANK_AS_NULL).getStringCellValue ()
			cell = rr.getCell (2,Row.RETURN_BLANK_AS_NULL)
			cell_type = cell.getCellType()
			if (cell_type == Cell.CELL_TYPE_NUMERIC):
				ppx = rr.getCell (2,Row.RETURN_BLANK_AS_NULL).getNumericCellValue ()
			else:
				ppx = rr.getCell (2,Row.RETURN_BLANK_AS_NULL).getStringCellValue ()

			date_mod = rr.getCell (3,Row.RETURN_BLANK_AS_NULL).getStringCellValue ()
			if (key != None):
				population = int (ppx)
				dict_aa = dict_append_proc (dict_aa,key,name,population,date_mod)
#
	return	dict_aa
# ----------------------------------------------------------------
def excel_create_row_proc (sheet,row,key,name,population,date_mod):
	row1 = sheet.createRow (row)
	row1.createCell(0).setCellValue(key)
	row1.createCell(1).setCellValue (name)
	row1.createCell(2).setCellValue (population)
	row1.createCell(3).setCellValue (date_mod)
# ----------------------------------------------------------------
def jython_excel_write_proc (excel_file,dict_aa):
	print ("*** jython_excel_write_proc ***")
#
	wb = HSSFWorkbook ()
#
	sheet = wb.createSheet()
#
	row = 0
	for key in dict_aa.keys():
		unit = dict_aa[key]
		name = dict_aa[key]['name']
		population = dict_aa[key]['population']
		date_mod = dict_aa[key]['date_mod']
#
		excel_create_row_proc (sheet,row,key,name,population,date_mod)
		row += 1
#
	fos=FileOutputStream (excel_file)
	wb.write (fos)
	fos.close()
# ----------------------------------------------------------------
