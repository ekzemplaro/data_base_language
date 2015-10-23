#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	xlsx_manipulate.rb
#					Aug/07/2013
#
# --------------------------------------------------------
include Java
import	java.io.FileInputStream
import	java.io.FileOutputStream
import	java.lang.System
import	org.apache.poi.xssf.usermodel.XSSFWorkbook
import	org.apache.poi.ss.usermodel.Sheet
import	org.apache.poi.ss.usermodel.Row
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
#load '/var/www/data_base/common/jruby_common/jruby_sql_manipulate.rb'
# --------------------------------------------------------
def xlsx_read_proc (xlsx_file)
	fi = FileInputStream.new xlsx_file
	wb = XSSFWorkbook.new fi
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
			population = rr.getCell(2,Row.RETURN_BLANK_AS_NULL).getNumericCellValue().to_i
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
def xlsx_create_row_proc (sheet,row,key,name,population,date_mod)
	row1 = sheet.createRow(row)
	row1.createCell(0).setCellValue(key);
	row1.createCell(1).setCellValue(name);
	row1.createCell(2).setCellValue(population);
	row1.createCell(3).setCellValue(date_mod)
end
# --------------------------------------------------------
def xlsx_write_proc (xlsx_file,dict_aa)
	puts "*** xlsx_write_proc ***"
	wb = XSSFWorkbook.new
	sheet1 = wb.createSheet()
#
	row = 0
	dict_aa.each {|key, value|
		name = value["name"]
		population = value["population"]
		date_mod = value["date_mod"]
		xlsx_create_row_proc(sheet1,row,key,name,population,date_mod)
		row += 1
	}
#
	fos = FileOutputStream.new xlsx_file
	wb.write(fos);
	fos.close()
end
# --------------------------------------------------------
