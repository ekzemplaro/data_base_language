#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ---------------------------------------------------------------------
//
//	textbox02.js
//
//					Sep/29/2015
//
// ---------------------------------------------------------------------
importPackage (org.apache.poi.xssf.usermodel);

load ("/var/www/data_base/lang/examples/apache_poi/rhino/common/poi_common.js");

// ---------------------------------------------------------------------
print ("*** start ***");

var xlsx_in = arguments[0];
var xlsx_out = arguments[1];

print (xlsx_in);
print (xlsx_out);

var pos_org = [[-241,96],[-345,96],
				[-241,184],[-345,184],
				[-241,272],[-345,272],
				[-241,360],[-345,360],
				[-241,448],[-345,448]
				];

var workbook = workbook_read_proc (xlsx_in);

var sheet = workbook.getSheetAt (0);

var drawing = sheet.createDrawingPatriarch();

var pos_center = [100,200];
var arm_width = 40;
var arm_height = 20;
draw_textbox_proc (sheet,drawing,pos_center,arm_width,arm_height,"Morning");

pos_center[0] = 200; 
draw_textbox_proc (sheet,drawing,pos_center,arm_width,arm_height,"Afternoon");

pos_center[0] = 300; 
draw_textbox_proc (sheet,drawing,pos_center,arm_width,arm_height,"Evening");

workbook_out_proc (workbook,xlsx_out);

print ("*** end ***");

// ---------------------------------------------------------------------

// ---------------------------------------------------------------------
