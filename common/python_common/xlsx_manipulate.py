# -*- coding: utf-8 -*-
#
#	xlsx_manipulate.py
#
#						May/30/2017
#
# -------------------------------------------------------------------
import sys
import os

from openpyxl import Workbook
from openpyxl import load_workbook
# -------------------------------------------------------------------
def xlsx_read_proc (xlsx_file):
	dict_aa = {}
	wb = load_workbook (filename = xlsx_file)
	ws = wb.active

	print (ws.max_row)
	max_row = ws.max_row
	for row in ws.rows:
		unit_aa = {}
		key = row[0].value
		unit_aa['name'] = row[1].value
		unit_aa['population'] = int (row[2].value)
		unit_aa['date_mod'] = row[3].value
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
	os.chmod (xlsx_file,0o766)
# -------------------------------------------------------------------
