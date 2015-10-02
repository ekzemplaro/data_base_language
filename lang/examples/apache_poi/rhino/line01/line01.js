#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ---------------------------------------------------------------------
//
//	line01.js
//
//					Sep/29/2015
//
// ---------------------------------------------------------------------
importPackage (org.apache.poi.xssf.usermodel);

load ("/var/www/data_base/lang/examples/apache_poi/rhino/common/poi_common.js");
// ---------------------------------------------------------------------
print ("*** start ***");

var xlsx_out = arguments[0];

var workbook = new XSSFWorkbook();

var sheet = workbook.createSheet();

var drawing =  sheet.createDrawingPatriarch();

var pos_start = [100,100]
var pos_end = [200,200]
draw_line_proc (sheet,drawing,pos_start,pos_end,"blue");

var pos_aa = [50,100]
var pos_bb = [50,200]
draw_line_proc (sheet,drawing,pos_aa,pos_bb,"red");

var arm = 5
draw_cross_proc (sheet,drawing,pos_aa,arm,"green");
draw_cross_proc (sheet,drawing,pos_bb,arm,"green");

workbook_out_proc (workbook,xlsx_out);

print ("*** end ***");

// ---------------------------------------------------------------------
