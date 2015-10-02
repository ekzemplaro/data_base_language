#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ---------------------------------------------------------------------
//
//	circle03.js
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

var pos_org = [[-241,96],[-345,96],[-241,184],
	[-345,184],[-241,272],[-345,272],
	[-241,360],[-345,360],[-241,448],[-345,448]];

var workbook = workbook_read_proc (xlsx_in);

var sheet = workbook.getSheetAt (0);

var drawing = sheet.createDrawingPatriarch();

var radius = 19;

for (var it in pos_org)
	{
	var pos = pos_org[it];
	var str_out = pos[0] + "\t" + pos[1] + "\t";

	var xx_new = -pos[0] * 0.75 + 130.0;
	var yy_new = pos[1] * 0.75 + 210.0;
		
	var pos_aa = [parseInt (xx_new),parseInt (yy_new) ];
	str_out += pos_aa[0] + "\t" + pos_aa[1];

	print (str_out);

	draw_circle_proc (sheet,drawing,pos_aa,radius,"black");
	}

workbook_out_proc (workbook,xlsx_out);

print ("*** end ***");

// ---------------------------------------------------------------------
