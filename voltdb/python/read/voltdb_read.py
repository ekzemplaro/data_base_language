#!/usr/bin/python
# -*- coding: utf-8 -*-
#
#	voltdb_read.py
#
#					Jan/30/2012
#
# ------------------------------------------------------------------
from voltdbclient import *

# ------------------------------------------------------------------
def show_row_proc (key_in):
	response = proc.call ([key_in])
	for xx in response.tables:
	    print xx
#
# ------------------------------------------------------------------
print	("*** 開始 ***")
#
client = FastSerializer("localhost", 21212)
proc = VoltProcedure( client, "Insert", [FastSerializer.VOLTTYPE_STRING, FastSerializer.VOLTTYPE_STRING, FastSerializer.VOLTTYPE_STRING] )

proc = VoltProcedure( client, "Select", [FastSerializer.VOLTTYPE_STRING])
#
keys = {"t3951","t3952","t3953","t3954","t3955", \
	"t3956","t3957","t3958","t3959"}
for key in keys:
	show_row_proc (key)
#
print	("*** 終了 ***")
# ------------------------------------------------------------------
