#! /usr/bin/jython
# -*- encoding: utf-8 -*-
# ----------------------------------------------------------
#
#	epub_createapy.
#
#						Sep/17/2014
#
# ----------------------------------------------------------
import	sys
import	java
from java.lang import	System
from java.lang import	String

from java.io import FileOutputStream

from com.adobe.dp.epub.io import OCFContainerWriter
from com.adobe.dp.epub.ncx import TOCEntry
from com.adobe.dp.epub.opf import NCXResource
from com.adobe.dp.epub.opf import OPSResource
from com.adobe.dp.epub.opf import Publication
from com.adobe.dp.epub.ops import Element
from com.adobe.dp.epub.ops import OPSDocument


sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_append_proc
# ----------------------------------------------------------
def dict_to_epub_proc (epub_file,dict_aa):
	epub = Publication()

	epub.addDCMetadata("title", "My First EPUB")
	epub.addDCMetadata("creator", System.getProperty("user.name"))
	epub.addDCMetadata("language", "ja")

	toc = epub.getTOC()
	rootTOCEntry = toc.getRootTOCEntry()

	main = epub.createOPSResource("OPS/main.html")
	epub.addToSpine(main)

	mainDoc = main.getDocument()

	mainTOCEntry = toc.createTOCEntry("Intro", mainDoc.getRootXRef())
	rootTOCEntry.add(mainTOCEntry)

	body = mainDoc.getBody()

	for key in dict_aa.keys():
		unit_aa=dict_aa[key];
		paragraph_bb = mainDoc.createElement("p")
		name = unit_aa["name"]
#
		population = unit_aa["population"]
		str_population = str (population)
		date_mod = unit_aa["date_mod"]
		paragraph_bb.add(key)
		paragraph_bb.add(" ")
		paragraph_bb.add(name)
		paragraph_bb.add(" ")
		paragraph_bb.add(str_population)
		paragraph_bb.add(" ")
		paragraph_bb.add(date_mod)
		body.add(paragraph_bb)

	writer = OCFContainerWriter (FileOutputStream(epub_file))
#	writer = OCFContainerWriter.new(FileOutputStream.new(epub_file))
	epub.serialize(writer)
#
# ----------------------------------------------------------
def data_prepare_proc ():
	dict_aa = {}

	dict_aa = dict_append_proc(dict_aa,'t1931','甲府'.decode('utf-8'),81635,'2004-2-11')
	dict_aa = dict_append_proc(dict_aa,'t1932','富士吉田'.decode('utf-8'),39427,'2004-4-23')
	dict_aa = dict_append_proc(dict_aa,'t1933','都留'.decode('utf-8'),61523,'2004-5-24')
	dict_aa = dict_append_proc(dict_aa,'t1934','山梨'.decode('utf-8'),18624,'2004-9-14')
	dict_aa = dict_append_proc(dict_aa,'t1935','大月'.decode('utf-8'),72931,'2004-8-12')
	dict_aa = dict_append_proc(dict_aa,'t1936','韮崎'.decode('utf-8'),28519,'2004-7-28')
	dict_aa = dict_append_proc(dict_aa,'t1937','南アルプス'.decode('utf-8'),39457,'2004-6-19')
	dict_aa = dict_append_proc(dict_aa,'t1938','北杜'.decode('utf-8'),36872,'2004-11-15')
	dict_aa = dict_append_proc(dict_aa,'t1939','甲斐'.decode('utf-8'),81235,'2004-10-24')

	return	dict_aa
#
# ----------------------------------------------------------
print ("*** 開始 ***")

epub_file = sys.argv[1]

dict_aa = data_prepare_proc()

dict_to_epub_proc(epub_file,dict_aa)

print ("*** 終了 ***")
# ----------------------------------------------------------
