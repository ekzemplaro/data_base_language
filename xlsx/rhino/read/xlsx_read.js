#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ----------------------------------------------------------------
/*
	xlsx_read.js
					Oct/09/2015

*/
// ----------------------------------------------------------------
load ("/var/www/data_base/common/rhino_common/text_manipulate.js")
load ("/var/www/data_base/common/rhino_common/xlsx_manipulate.js")

// ----------------------------------------------------------------
print ("*** 開始 ***")

var xlsx_file = arguments[0]

var dict_aa = xlsx_read_proc (xlsx_file)

dict_display_proc (dict_aa)

print ("*** 終了 ***")
  
// ----------------------------------------------------------------
