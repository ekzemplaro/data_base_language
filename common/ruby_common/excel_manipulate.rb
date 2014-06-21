#! /usr/bin/ruby1.8
# -*- coding: utf-8 -*-
#
#	excel_manipulate.rb
#
#					Jul/31/2011
#
# -------------------------------------------------------------------
require 'spreadsheet'

# -------------------------------------------------------------------
def excel_row_read_proc (sheet,row,dict_aa)
	id = sheet[row,0]

	if (id != nil)
		name = sheet[row,1]
		population = sheet[row,2]
		date_mod = sheet[row,3]

		dict_aa = dict_append_proc(dict_aa,id,name,population,date_mod)
	end

	return dict_aa
end
# -------------------------------------------------------------------
def excel_read_proc (file_excel)
	dict_aa = {}
#
	xls = Spreadsheet.open(file_excel, 'rb')
	sheet = xls.worksheet(0)
	for row in 0..8 do
		dict_aa = excel_row_read_proc(sheet,row,dict_aa)
	end

	return	dict_aa
end
#
# -------------------------------------------------------------------
def excel_row_create_proc (sheet,row,key,value)
	sheet[row,0] = key
	sheet[row,1] = value['name']
	sheet[row,2] = value['population']
	sheet[row,3] = value['date_mod']
end
# -------------------------------------------------------------------
def excel_write_proc (excel_file,dict_aa)
	book = Spreadsheet::Workbook.new
	sheet = book.create_worksheet
#
	row = 0
	dict_aa.each {|key, value|
		excel_row_create_proc(sheet,row,key,value)
		row = row + 1

	}

	book.write(excel_file)
end
# -------------------------------------------------------------------
