# -*- coding: utf-8 -*-
#
#	pdf_manipulate.py
#
#						Oct/02/2018
#
# ------------------------------------------------------------------
import	os
import	string

import	sys
import	pdftotext
#
from reportlab.pdfbase.cidfonts import UnicodeCIDFont
from reportlab.pdfbase import pdfmetrics
#
from text_manipulate import dict_append_proc
# ------------------------------------------------------------------
def pdf_to_dict_proc (file_pdf):
	dict_aa = {}
#
	fp_in = open(file_pdf, "rb")
	pdf = pdftotext.PDF(fp_in)
	fp_in.close()
#
	lines = pdf[0].split("\n")
	for str in lines:
		line = str.rstrip()
		if (5 < len (line)):
			cols= line.split ()
			key = cols[0]
			name = cols[1]
			population = cols[2]
			date_mod = cols[3]
			if (key[0] == "t"):
				dict_aa = dict_append_proc (dict_aa,key, \
					name,population,date_mod)
#
	return	dict_aa
# ------------------------------------------------------------------
def dict_to_pdf_proc (file_pdf,dict_aa):
	from reportlab.pdfgen import canvas
	fontname_g = "HeiseiKakuGo-W5"
	pdfmetrics.registerFont (UnicodeCIDFont (fontname_g))
	canvas = canvas.Canvas (file_pdf)

	canvas.setFont (fontname_g, 20)

	ypos = 700
	for key in sorted (dict_aa.keys()):
		unit = dict_aa[key]
		canvas.drawString (50,ypos,key)
		canvas.drawString (185,ypos,unit['name'])
		canvas.drawString (285,ypos,str (unit['population']))
		canvas.drawString (400,ypos,unit['date_mod'])
		ypos = ypos - 25
#
	canvas.save ()
# ------------------------------------------------------------------
