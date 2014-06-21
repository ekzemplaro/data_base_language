#! /usr/bin/tclsh
# -*- coding: utf-8 -*-
#
#	json_tcl_read.tcl
#
#					Dec/01/2010
#
# ---------------------------------------------------------------------
puts "Content-type: text/json\n\n"

set fname_in "/var/tmp/json/cities.json"
set fileID [open $fname_in "r"]
while {! [eof $fileID]} {
	set line [gets $fileID]
	puts "$line"
}
close $fileID
#
# ---------------------------------------------------------------------
