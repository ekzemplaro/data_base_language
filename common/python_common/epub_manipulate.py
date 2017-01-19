# -*- coding: utf-8 -*-
#
#	epub_manipulate.py
#
#						Sep/17/2014
#
import	os
from subprocess import Popen, PIPE
import	shlex
import	string
import	sys
#
from reportlab.pdfbase.cidfonts import UnicodeCIDFont
from reportlab.pdfbase import pdfmetrics
#
from text_manipulate import dict_append_proc
from text_manipulate import text_write_proc
# ------------------------------------------------------------------
def epub_to_dict_proc (file_epub):
	dict_aa = {}
#
	cmdline = "java -jar /var/www/data_base/common/jar/tika-app-1.0.jar -t " + file_epub
	args = shlex.split(cmdline)
	result = Popen(args, stdout=PIPE).stdout.readlines()

	for str in result:
		line = str.rstrip()
		if (5 < len (line)):
			cols= line.split ()
			if (3 < len (cols)):
				if (cols[0][0] == "t"):
					population = int (cols[2])
					dict_aa = dict_append_proc \
			 (dict_aa,cols[0],cols[1],population,cols[3])
#
	return	dict_aa
# ------------------------------------------------------------------
def dict_to_epub_proc (file_epub,dict_aa):
	file_tmp = "/tmp/tmp0042389.txt"

	text_write_proc (file_tmp,dict_aa)

	cmdline = "ebook-convert " +  file_tmp + " " +file_epub \
		+ " --no-default-epub-cover"
	os.system (cmdline)
	os.remove (file_tmp)
#
# ------------------------------------------------------------------
