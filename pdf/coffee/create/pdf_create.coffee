#! /usr/bin/coffee
# ---------------------------------------------------------------
#	pdf_create.coffee
#
#						Jan/10/2017
#
# ---------------------------------------------------------------
PDFDocument = require('pdfkit')
fs = require('fs')
text_manipulate=require ("/var/www/data_base/common/coffee_common/text_manipulate")
#
# ---------------------------------------------------------------
data_prepare_proc = () ->
	dict_aa = new Object

	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2531','大津',85614,'1954-9-12')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2532','草津',69157,'1954-3-15')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2533','守山',29371,'1954-10-2')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2534','栗東',82664,'1954-6-22')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2535','野洲',13658,'1954-8-14')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2536','甲賀',65792,'1954-9-12')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2537','湖南',38251,'1954-3-21')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2538','近江八幡',52486,'1954-7-26')
	dict_aa = text_manipulate.dict_append_proc(dict_aa,'t2539','彦根',26857,'1954-11-18')
	
	return	dict_aa

# ---------------------------------------------------------------
console.error "*** 開始 ***"

doc = new PDFDocument

file_pdf=process.argv[2]

dict_aa = data_prepare_proc()
 
doc.pipe(fs.createWriteStream (file_pdf))

doc.font ('/var/www/data_base/common/node_common/IPAexfont00301/ipaexm.ttf') 

array_aa = text_manipulate.sort_key_proc(dict_aa)

yy = 10
for unit in array_aa
	key = unit.key
	value = unit.value

	doc.save()
	   .fontSize(25)
	   .text(key, 50, yy)
	   .text(value.name, 150, yy)
	   .text(value.population, 300, yy)
	   .text(value.date_mod, 400, yy)

	yy += 50

doc.end()

console.error "*** 終了 ***"
# ---------------------------------------------------------------
