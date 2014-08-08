#! /usr/bin/coffee
#
#	pdf_create.coffee
#
#					Aug/06/2014
# ---------------------------------------------------------------
fs = require('fs')
text_manipulate= require ('/var/www/data_base/common/coffee_common/text_manipulate')
# ---------------------------------------------------------------
data_prepare_proc = () ->
	dict_aa = new Object

	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2381','名古屋',61724,'1954-8-12')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2382','豊橋',52938,'1954-2-15')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2383','岡崎',28741,'1954-10-2')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2384','一宮',31564,'1954-6-22')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2385','蒲郡',49271,'1954-8-14')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2386','常滑',65292,'1954-9-12')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2387','大府',31251,'1954-3-21')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2388','瀬戸',52486,'1954-7-26')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2389','犬山',26257,'1954-10-2')

	return dict_aa
# ---------------------------------------------------------------
console.log "*** 開始 ***"
file_pdf = process.argv[2]
console.log file_pdf

PDFDocument = require 'pdfkit-cjk'
doc = new PDFDocument

#doc.pipe fs.createWriteStream (file_pdf)

dict_aa = data_prepare_proc()

yy_pos = 100

delimit = '  '

for key,value  of  dict_aa
	if (1 < key.length)
		out_str = key + delimit + value.name
		out_str += delimit + value.population
		out_str += delimit + value.date_mod
		console.log yy_pos,out_str
#		doc.font('Times-Roman')
		doc.font('Courier')
#		doc.font('fonts/ipaexg.ttf')
		   .fontSize(25)
		   .text(out_str, 100, yy_pos)
		yy_pos += 30
#
#
doc.write (file_pdf)
#doc.end()

console.log "*** 終了 ***\n"
# ---------------------------------------------------------------
