#! /usr/bin/jruby
# -*- encoding: utf-8 -*-
# ----------------------------------------------------------
#
#	epub_create.rb
#
#						Jan/06/2012
#
# ----------------------------------------------------------
include	Java

import	java.util.HashMap
import	java.util.Set
import	java.lang.System

import java.io.FileOutputStream

import com.adobe.dp.epub.io.OCFContainerWriter
import com.adobe.dp.epub.ncx.TOCEntry
import com.adobe.dp.epub.opf.NCXResource
import com.adobe.dp.epub.opf.OPSResource
import com.adobe.dp.epub.opf.Publication
import com.adobe.dp.epub.ops.Element
import com.adobe.dp.epub.ops.OPSDocument


load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
# ----------------------------------------------------------
def dict_to_epub_proc (epub_file,dict_aa)
#	epub = new Publication()
	epub = Publication.new()

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


	dict_aa.each {|key, dict_unit|
		paragraph_bb = mainDoc.createElement("p")
		name = dict_unit["name"]
		population = dict_unit["population"]
		str_population = population.to_s
#
		date_mod = dict_unit["date_mod"]
		paragraph_bb.add(key)
		paragraph_bb.add(" ")
		paragraph_bb.add(name)
		paragraph_bb.add(" ")
		paragraph_bb.add(str_population)
		paragraph_bb.add(" ")
		paragraph_bb.add(date_mod)
		body.add(paragraph_bb)
		}

		writer = OCFContainerWriter.new(FileOutputStream.new(epub_file))
		epub.serialize(writer)
end

# ----------------------------------------------------------
def data_prepare_proc ()
dict_aa = {}

dict_aa = dict_append_proc(dict_aa,"t1931","甲府",27635,"2007-2-15")

dict_aa = dict_append_proc(dict_aa,"t1932","富士吉田",91427,"2007-4-23")

dict_aa = dict_append_proc(dict_aa,"t1933","都留",91523,"2007-5-24")

dict_aa = dict_append_proc(dict_aa,"t1934","山梨",14624,"2007-9-14")

dict_aa = dict_append_proc(dict_aa,"t1935","大月",72131,"2007-8-12")

dict_aa = dict_append_proc(dict_aa,"t1936","韮崎",28529,"2007-7-28")

dict_aa = dict_append_proc(dict_aa,"t1937","南アルプス",39457,"2007-6-19")

dict_aa = dict_append_proc(dict_aa,"t1938","北杜",36572,"2007-11-15")

dict_aa = dict_append_proc(dict_aa,"t1939","甲斐",87935,"2007-10-24")

return	dict_aa
end

# ----------------------------------------------------------
puts "*** 開始 ***"

epub_file = ARGV[0]

dict_aa = data_prepare_proc()

dict_to_epub_proc(epub_file,dict_aa)

puts "*** 終了 ***"
# ----------------------------------------------------------
