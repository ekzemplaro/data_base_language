#! /usr/bin/node
// ---------------------------------------------------------------
//	pdf_create.js
//
//						Jan/10/2017
//
// ---------------------------------------------------------------
var PDFDocument = require('pdfkit')
var fs = require('fs')
var text_manipulate=require ("/var/www/data_base/common/node_common/text_manipulate")
//
// ---------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2531','大津',93814,'1950-9-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2532','草津',23657,'1950-3-15')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2533','守山',65291,'1950-10-2')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2534','栗東',31864,'1950-6-22')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2535','野洲',49158,'1950-8-14')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2536','甲賀',65792,'1950-9-12')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2537','湖南',38251,'1950-3-21')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2538','近江八幡',52486,'1950-7-26')
	dict_aa = text_manipulate.dict_append_proc (dict_aa,'t2539','彦根',26857,'1950-11-18')
	
	return	dict_aa
}

// ---------------------------------------------------------------
var doc = new PDFDocument

const file_pdf=process.argv[2]

const dict_aa = data_prepare_proc ()
 
doc.pipe(fs.createWriteStream (file_pdf))

doc.font ('/var/www/data_base/common/node_common/IPAexfont00301/ipaexm.ttf') 

const array_aa = text_manipulate.sort_key_proc (dict_aa)

var yy = 10
for (var it in array_aa)
	{
	const key = array_aa[it].key
	const value = array_aa[it].value

	doc.save()
	   .fontSize(25)
	   .text(key, 50, yy)
	   .text(value.name, 150, yy)
	   .text(value.population, 300, yy)
	   .text(value.date_mod, 400, yy)

	yy += 50
	}

 

doc.end()
// ---------------------------------------------------------------
