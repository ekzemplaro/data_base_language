#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	jython_xlsx_manipulate.py
#					Aug/07/2013
#
# ----------------------------------------------------------------
#
import	sys
import	string
#
from 	java.io import FileInputStream
from 	java.io import FileOutputStream
from 	org.apache.poi.xssf.usermodel import XSSFWorkbook
from 	org.apache.poi.ss.usermodel import Row
#
# ----------------------------------------------------------------
sys.path.append ('/var/www/data_base/common/python_common')
sys.path.append ('/var/www/data_base/common/jython_common')
from text_manipulate import dict_append_proc
# from jython_text_manipulate import jython_dict_display_proc
# ----------------------------------------------------------------
def jython_xlsx_read_proc (xlsx_file):
	print ("*** xlsx_read_proc ***")
#
	dict_aa = {}
	fi=FileInputStream (xlsx_file)
	wb = XSSFWorkbook (fi)
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
			ppx = rr.getCell (2,Row.RETURN_BLANK_AS_NULL).getNumericCellValue ()
			date_mod = rr.getCell (3,Row.RETURN_BLANK_AS_NULL).getStringCellValue ()
			if (key != None):
				population = int (ppx)
				dict_aa = dict_append_proc (dict_aa,key,name,population,date_mod)
#
	return	dict_aa
# ----------------------------------------------------------------
def xlsx_create_row_proc (sheet,row,key,name,population,date_mod):
	row1 = sheet.createRow (row)
	row1.createCell(0).setCellValue(key)
	row1.createCell(1).setCellValue (name)
	row1.createCell(2).setCellValue (population)
	row1.createCell(3).setCellValue (date_mod)
# ----------------------------------------------------------------
def jython_xlsx_write_proc (xlsx_file,dict_aa):
	print ("*** jython_xlsx_write_proc ***")
#
	wb = XSSFWorkbook ()
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
		xlsx_create_row_proc (sheet,row,key,name,population,date_mod)
		row += 1
#
	fos=FileOutputStream (xlsx_file)
	wb.write (fos)
	fos.close()
# ----------------------------------------------------------------
