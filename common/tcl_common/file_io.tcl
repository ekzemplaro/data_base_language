#! /usr/bin/tclsh8.5
#
#	file_io.tcl
#
#					Oct/13/2011
#
# ---------------------------------------------------------------
#
# ---------------------------------------------------------------
proc file_to_str {file_in} {
	set fileID [open $file_in "r"]
	set str_in ""
	while {! [eof $fileID]} {
		set line [gets $fileID]
		append str_in $line
		}
	close $fileID

	return	$str_in
}

# ---------------------------------------------------------------
