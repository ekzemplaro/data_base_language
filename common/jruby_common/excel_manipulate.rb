#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	excel_manipulate.rb
#					Aug/08/2013
#
# --------------------------------------------------------
include Java
import	java.io.FileInputStream
import	java.io.FileOutputStream
import	java.lang.System
import	org.apache.poi.hssf.usermodel.HSSFWorkbook
import	org.apache.poi.ss.usermodel.Sheet
import	org.apache.poi.ss.usermodel.Row
import	org.apache.poi.ss.usermodel.Cell
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
# --------------------------------------------------------
def excel_read_proc (excel_file)
	fi = FileInputStream.new excel_file
	wb = HSSFWorkbook.new fi
	fi.close()
#
	sheet = wb.getSheetAt(0)
	puts "--- "+ sheet.getSheetName()+" ---"
	sheet.setForceFormulaRecalculation(true)
#
	dict_aa = {}
#
	for row in 0..9 do
		rr = sheet.getRow(row)
		if not rr.nil? then
			key = rr.getCell(0,Row.RETURN_BLANK_AS_NULL).getStringCellValue()
			name = rr.getCell(1,Row.RETURN_BLANK_AS_NULL).getStringCellValue()
			cell = rr.getCell(2,Row.RETURN_BLANK_AS_NULL)
			cell_type = cell.getCellType()
			if cell_type == Cell.CELL_TYPE_NUMERIC then
				population = rr.getCell(2,Row.RETURN_BLANK_AS_NULL).getNumericCellValue().to_i
			else
				population = rr.getCell(2,Row.RETURN_BLANK_AS_NULL).getStringCellValue().to_i
			end

			date_mod = rr.getCell(3,Row.RETURN_BLANK_AS_NULL).getStringCellValue()
			if not key.nil? then
				dict_aa = dict_append_proc(dict_aa,key,name,population,date_mod)
			end
		end
	end
#
	return	dict_aa
end
# --------------------------------------------------------
def excel_create_row_proc (sheet,row,key,name,population,date_mod)
	row1 = sheet.createRow(row)
	row1.createCell(0).setCellValue(key);
	row1.createCell(1).setCellValue(name);
	row1.createCell(2).setCellValue(population);
	row1.createCell(3).setCellValue(date_mod)
end
# --------------------------------------------------------
def excel_write_proc (excel_file,dict_aa)
	puts "*** xlsx_write_proc ***"
	wb = HSSFWorkbook.new
	sheet1 = wb.createSheet()
#
	row = 0
	dict_aa.each {|key, value|
		name = value["name"]
		population = value["population"]
		date_mod = value["date_mod"]
		excel_create_row_proc(sheet1,row,key,name,population,date_mod)
		row += 1
	}
#
	fos = FileOutputStream.new excel_file
	wb.write(fos);
	fos.close()
end
# --------------------------------------------------------
