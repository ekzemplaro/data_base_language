#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	simple_30/simple_30.py
#
#					Sep/29/2014
#
# --------------------------------------------------------
import	sys
#
import tkinter
import tkinter.scrolledtext
#
# --------------------------------------------------------
sys.stderr.write ("*** start ***\n")
#
win = tkinter.Tk ()
frame_aa = tkinter.Frame (master = win,bg = '#808000')
frame_aa.pack	(fill='both', expand='yes')
label = tkinter.Label(frame_aa, \
	text= "Example, Good Morning."
	, width=35, wraplength='8c', \
	font=('Helvetica', '14'), justify=tkinter.LEFT)
#
label.pack()
editArea = tkinter.scrolledtext.ScrolledText(
	master = frame_aa,
	wrap   = tkinter.WORD,
	width  = 40,
	height = 15
	)

editArea.pack(padx=10, pady=5)
list_aa = ["AAA","BBB","CCC","DDD","EEE","FFF", \
				"GGG","HHH","III","JJJ","KKK","LLL",
				"MMM","NNN","OOO","PPP","QQQ","RRR"]
str_out = ""
for line in list_aa:
	str_out += line + "\n"
editArea.insert (tkinter.INSERT,str_out)

frame_aa.mainloop	()
#
sys.stderr.write ("*** end ***\n")
# --------------------------------------------------------
