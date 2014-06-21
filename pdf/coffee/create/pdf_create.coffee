#! /usr/bin/coffee
#
#	pdf_create.coffee
#
#					Aug/10/2012
# ---------------------------------------------------------------
fs = require('fs')
text_manipulate= require ('/var/www/data_base/common/coffee_common/text_manipulate')
# ---------------------------------------------------------------
data_prepare_proc = () ->
	dict_aa = new Object

	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2381','名古屋',65724,'1954-8-12')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2382','豊橋',57938,'1954-2-15')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2383','岡崎',29741,'1954-10-2')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2384','一宮',38764,'1954-6-22')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2385','蒲郡',49871,'1954-8-14')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2386','常滑',65292,'1954-9-12')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2387','大府',31251,'1954-3-21')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2388','瀬戸',52486,'1954-7-26')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2389','犬山',26257,'1954-10-2')

	return dict_aa
# ---------------------------------------------------------------
console.log "*** 開始 ***"

PDFDocument = require 'pdfkit'
doc = new PDFDocument


dict_aa = data_prepare_proc()


yy_pos = 100

delimit = '  '

for key,value  of  dict_aa
	if (1 < key.length)
		out_str = key + delimit + value.name
		out_str += delimit + value.population
		out_str += delimit + value.date_mod
		console.log "*** check ***"
		console.log yy_pos
		doc.font('Times-Roman')
		   .fontSize(25)
		   .text(out_str, 100, yy_pos)
		yy_pos += 30



# Write the PDF file to disk
doc.write 'output.pdf'

console.log "*** 終了 ***\n"
# ---------------------------------------------------------------
