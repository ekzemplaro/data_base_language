# -*- coding: utf-8 -*-
#
#	xlsx_manipulate.py
#
#						Aug/19/2013
#
# -------------------------------------------------------------------
import sys
import os

from openpyxl import Workbook
from openpyxl import load_workbook
# -------------------------------------------------------------------
def xlsx_read_proc (xlsx_file):
	dict_aa = {}
	wb = load_workbook (filename = xlsx_file);
	ws = wb.get_active_sheet()

	print ws.get_highest_column()
	max_row = ws.get_highest_row()
	for row in range (1,max_row + 1): 
		unit_aa = {}
		key = ws.cell('A%d' % row).value
		unit_aa['name'] = ws.cell('B%d' % row).value
		unit_aa['population'] = int (ws.cell('C%d' % row).value)
		unit_aa['date_mod'] = ws.cell('D%d' % row).value
		dict_aa[key] = unit_aa
#
	return	dict_aa
# -------------------------------------------------------------------
def xlsx_write_proc (xlsx_file,dict_aa):
	wb = Workbook()
	ws = wb.worksheets[0]
	ws.title = "Cities"

	row = 1
	for key in dict_aa.keys():
		ws.cell('A%s' % row).value = key
		ws.cell('B%s' % row).value = dict_aa[key]['name']
		ws.cell('C%s' % row).value = dict_aa[key]['population']
		ws.cell('D%s' % row).value = dict_aa[key]['date_mod']
		row += 1
#
	wb.save (filename = xlsx_file)
#
	os.chmod (xlsx_file,0766)
# -------------------------------------------------------------------
