#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// --------------------------------------------------------------
//
//	epub_read.scala
//
//					Jan/10/2012
// --------------------------------------------------------------
importPackage (java.lang);

importPackage (java.io);
importPackage (org.xml.sax);

importPackage (java.util);

load ("/var/www/data_base/common/rhino_common/text_manipulate.js");
// --------------------------------------------------------------
print ("*** 開始 ***");

var file_epub = arguments[0];

var dict_aa = tika_manipulate.tika_parse (file_epub,"epub_read");

text_manipulate.dict_display_proc (dict_aa);

print ("*** 終了 ***");

// --------------------------------------------------------------
