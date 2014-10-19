#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	sobaya_30.py
#
#						Sep/29/2014
import sys

import tkinter as Tk
#-------------------------------------------------------------------------
MENU = ["天丼","カツ丼","うな重","親子丼","盛りそば",
	"掛けそば","鍋焼きうどん",  
	"月見うどん","きつねうどん","狸うどん","素うどん",
	"山菜そば","ととろそば","鴨せいろ","天せいろ"]
#
# -------------------------------------------------------------------------
class ScrolledListbox(Tk.Listbox):
	""" Listbox with vertical scroll bar """
	def __init__(self, master, **key):
		self.frame = Tk.Frame(master)
		self.yscroll = Tk.Scrollbar (self.frame, orient=Tk.VERTICAL)
		self.yscroll.pack(side=Tk.RIGHT, fill=Tk.Y, expand=1)
		key['yscrollcommand']=self.yscroll.set
		Tk.Listbox.__init__(self, self.frame, **key)
		self.pack(side=Tk.LEFT, fill=Tk.BOTH, expand=1)
		self.yscroll.config(command=self.yview)

	# Copy geometry methods of self.frame 
		lists = list (Tk.Pack.__dict__.keys())
		lists += list (Tk.Grid.__dict__.keys())
		lists += list (Tk.Place.__dict__.keys())
		for m in lists:
			m[0] == '_' or m == 'config' or m == 'configure' or \
				setattr(self, m, getattr(self.frame, m))
#
# -------------------------------------------------------------------------
class Frame(Tk.Frame):
	def __init__(self, master=None):
		Tk.Frame.__init__(self, master)
		self.master.title ("Tk そば屋")
		message = "いらっしゃい、ご注文は？\n"
		message += "（マウス左ダブルクリックで注文してください）"
		intro = Tk.Label (self, font=('Helvetica', '12'),
			justify=Tk.LEFT, wraplength='10c', width=40,
			text = message)
		intro.pack()
		ff = Tk.Frame (self, bd=3, relief=Tk.RIDGE)
		ff.pack (fill=Tk.BOTH, expand=1)
		self.listbox = ScrolledListbox (ff,font=('Helvetica','10'))
		self.listbox.grid (row=0, column=0, rowspan=2,
			padx=5, pady=5, sticky=Tk.N+Tk.S)
		self.listbox.bind("<Double-Button-1>", self.select_menu)
		self.listbox.insert(Tk.END, *MENU)

		self.echo = Tk.StringVar()
		lecho = Tk.Label (ff,textvariable=self.echo,
			font= ('Helvetica','18','bold'),
			fg='#CC0000', width=20)
		lecho.grid(row=0, column=1, sticky=Tk.E + Tk.W)

		bb = Tk.Button(ff, text="まいどあり",
		font=('Helvetica', '14', 'bold'), fg='#000066',
			command = sys.exit)
		bb.grid (row=1, column=1)

	def select_menu(self, event):
		ii = self.listbox.index(Tk.ACTIVE)
		self.echo.set (MENU[ii] + " 一丁！")
#
# -------------------------------------------------------------------------
if __name__ == '__main__':
	frm_aa = Frame()
	frm_aa.pack()
	frm_aa.mainloop()
#
# -------------------------------------------------------------------------
