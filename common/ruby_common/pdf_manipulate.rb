#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	pdf_manipulate.rb
#
#					Jun/27/2012
#
# ---------------------------------------------------------------------
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
# ---------------------------------------------------------------------
def pdf_to_dict_proc (file_pdf)
	command = "| pdftotext -layout " + file_pdf + " -"
	ff = open(command)
	dict_aa = {}
	while(line = ff.gets)
		line=line.chomp
		cols = line.split()
		if 2 < cols.length then
			unit = {}
			unit['name'] = cols[1]
			unit['population'] = cols[2].to_i
			unit['date_mod'] = cols[3]
			key = cols[0]
			dict_aa[key]=unit
		end
	end
	ff.close
#
	return	dict_aa
end
# ---------------------------------------------------------------------
def dict_to_pdf_proc (file_pdf,dict_aa)
	pdf = HPDFDoc.new

	pdf.set_compression_mode(HPDFDoc::HPDF_COMP_ALL)
	pdf.use_jp_fonts
	pdf.use_jp_encodings
	font1 = pdf.get_font("MS-Gothic", "90ms-RKSJ-H")

	encoder = pdf.get_encoder("90ms-RKSJ-H")
	root = pdf.create_outline(nil, "日本語フォント", encoder);

	page = pdf.add_page
	height = page.get_height
	width = page.get_width

	page.set_line_width(1.0)
	page.rectangle(50.0, 50.0, width - 100.0, height - 110.0)
	page.stroke

	page.begin_text
	page.move_text_pos(60.0, height - 105.0)

	page.move_text_pos(0.0, -200.0)

	dict_aa.each {|key, value|
		page.set_font_and_size(font1, 20.0)
		page.show_text(key)
		page.move_text_pos(120.0, 0.0)
		page.show_text(value['name'].tosjis)
		page.move_text_pos(120.0, 0.0)
		page.show_text(value['population'].to_s)
		page.move_text_pos(120.0, 0.0)
		page.show_text(value['date_mod'].to_s)
		page.move_text_pos(-360.0, 25.0)
		}

	page.end_text

	pdf.save_to_file(file_pdf)

	File::chmod(0666,file_pdf)
end
# ---------------------------------------------------------------------
