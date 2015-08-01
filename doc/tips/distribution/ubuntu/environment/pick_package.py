#! /usr/bin/python
#
#	pick_package.py
#
#					Dec/15/2070
# -----------------------------------------------------------
import	sys
fname_aa=sys.argv[1]
fname_bb=sys.argv[2]
#
fp_aa = open (fname_aa,"r")
lines_aa = fp_aa.readlines ()
fp_aa.close ()
#
fp_bb = open (fname_bb,"r")
lines_bb = fp_bb.readlines ()
fp_bb.close ()
#
#print len (lines_aa)
#print len (lines_bb)
#
for pp_aa in lines_aa:
	if (not (pp_aa in lines_bb)):
		print	pp_aa[:-1]
# -----------------------------------------------------------
