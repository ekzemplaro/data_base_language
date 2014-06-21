#! /usr/bin/tclsh
# -*- coding: utf-8 -*-
#
#	text_tcl_read.tcl
#
#					May/27/2011
#
# ---------------------------------------------------------------------
proc record_create_proc {id name population date_mod tx} {
	set id_aa [join [list "\"" $id "\":\{ "] {}]
	set name_aa [join [list "\"name\":\"" $name "\","] {}]
	set population_aa [join [list "\"population\":" $population ","] {}]
	set date_mod_aa [join [list "\"date_mod\":\"" $date_mod "\"\}"] {}]
	set str_out [join [list $id_aa $name_aa $population_aa $date_mod_aa $tx] {}]
#
	return	$str_out
}

# ---------------------------------------------------------------------
puts "Content-type: text/json\n\n"

set fname_in "/var/tmp/plain_text/cities.txt"
set fileID [open $fname_in "r"]
set list_aa []
while {! [eof $fileID]} {
	set line [gets $fileID]
	set ll [string length $line]
	if {0 < $ll} {
	set pos [llength $list_aa]
	set list_aa [linsert $list_aa $pos $line]
		}
}
close $fileID

puts "\{"

set nmax [llength $list_aa]
set nmax [expr $nmax - 1]
set icount 0
foreach pp $list_aa {
	set qq [split $pp "\t"]
	set id [lindex $qq 0]
	set name [lindex $qq 1]
	set population [lindex $qq 2]
	set date_mod [lindex $qq 3]
	if {$icount < $nmax} {
	puts [record_create_proc $id $name $population $date_mod ","]
	} else {
	puts [record_create_proc $id $name $population $date_mod "\}"]
	}

	incr icount
#}

#
#puts "\}"
#
# ---------------------------------------------------------------------
