# -*- coding: utf-8 -*-
#
#	pdf_manipulate.py
#
#						Sep/09/2014
#
import	os
from subprocess import Popen, PIPE
import	shlex
import	string

import	sys
#reload(sys)
#sys.setdefaultencoding('utf-8')
#
from reportlab.pdfbase.cidfonts import UnicodeCIDFont
from reportlab.pdfbase import pdfmetrics
#
from text_manipulate import dict_append_proc
# ------------------------------------------------------------------
def pdf_to_dict_proc (file_pdf):
	dict_aa = {}
#
	cmdline = "pdftotext -layout " + file_pdf + " -"
	args = shlex.split(cmdline)
	result = Popen(args, stdout=PIPE).stdout.readlines()

	for str in result:
		line = str.rstrip()
#		print (line)
		if (5 < len (line)):
			cols= line.split ()
			key = cols[0].decode ('utf-8')
			name = cols[1].decode ('utf-8')
			population = cols[2].decode ('utf-8')
			date_mod = cols[3].decode ('utf-8')
#			print (str (cols[0],'utf-8'))
#			print (cols[0].decode ('utf-8'))
			if (key[0] == "t"):
				dict_aa = dict_append_proc (dict_aa,key, \
					name,population,date_mod)
#
	return	dict_aa
# ------------------------------------------------------------------
#
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
