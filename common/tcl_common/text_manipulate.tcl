#! /usr/bin/tclsh8.5
#
#	tcl_common/text_manipulate.tcl
#
#						Oct/14/2011
#
#
# ---------------------------------------------------------------
proc text_read_proc fname_in {
	set dict_aa [dict create]
	set fileID [open $fname_in "r"]
	while {! [eof $fileID]} {
		set line [gets $fileID]
		set len_aa [string length $line]
#		puts $len_aa
		if {0 < $len_aa} {
			set qq [split $line "\t"]
			set id_in [lindex $qq 0]
			set name_in [lindex $qq 1]
			set population_in [lindex $qq 2]
			set date_mod_in [lindex $qq 3]
			set unit_aa [dict create name $name_in \
				 population $population_in \
				 date_mod $date_mod_in]
			dict set dict_aa $id_in $unit_aa
			}
	}

	close $fileID

	return	$dict_aa
}

# ---------------------------------------------------------------
proc dict_display_proc dict_aa {
dict for {key value} $dict_aa {
	if {$key != "_id"} {
		if {$key != "_rev"} {
			set name [dict get $value name]
			set population [dict get $value population]
			set date_mod [dict get $value date_mod]
			puts "$key\t$name\t$population\t$date_mod"
			}
		}
	}
}
#
# ---------------------------------------------------------------
proc text_write_proc {fname_out dict_aa} {
	set fileID [open $fname_out "w"]

dict for {key value} $dict_aa {
	set name [dict get $dict_aa $key name]
	set population [dict get $dict_aa $key population]
	set date_mod [dict get $dict_aa $key date_mod]
	puts $fileID "$key\t$name\t$population\t$date_mod"
	}
	close $fileID
}
#
# ---------------------------------------------------------------
proc dict_append_proc {dict_aa key_in name_in population_in date_mod_in} {
	set unit_aa [dict create name $name_in \
			 population $population_in \
			 date_mod $date_mod_in]

	dict append dict_aa $key_in $unit_aa
#
	return	$dict_aa
}

# ---------------------------------------------------------------
proc dict_update_proc {dict_in id_in population_in} {
	set hantei [dict exists $dict_in $id_in]

	puts $hantei

	if {$hantei} {
	set today [clock format [clock seconds] -format {%Y-%m-%d}]
		puts "*** exists ***"

		set name_aa [dict get $dict_in $id_in name]

	set unit_aa [dict create name $name_aa \
			 population $population_in \
			 date_mod $today]

	dict set dict_in $id_in $unit_aa
	}
	return	$dict_in
}

# ---------------------------------------------------------------
proc dict_delete_proc {dict_in id_in} {
	set hantei [dict exists $dict_in $id_in]

	puts $hantei

	if {$hantei} {
		puts "*** exists ***"

		set dict_in [dict remove $dict_in $id_in]
		puts "*** removed ***"
	}

	return	$dict_in
}

# ---------------------------------------------------------------
proc csv_read_proc fname_in {
	set dict_aa [dict create]
	set fileID [open $fname_in "r"]
	while {! [eof $fileID]} {
		set line [gets $fileID]
		set len_aa [string length $line]
#		puts $len_aa
		if {0 < $len_aa} {
			set qq [split $line ","]
			set id_in [lindex $qq 0]
			set name_in [lindex $qq 1]
			set population_in [lindex $qq 2]
			set date_mod_in [lindex $qq 3]
			set unit_aa [dict create name $name_in \
				 population $population_in \
				 date_mod $date_mod_in]
			dict set dict_aa $id_in $unit_aa
			}
	}

	close $fileID

	return	$dict_aa
}

# ---------------------------------------------------------------
proc csv_write_proc {fname_out dict_aa} {
	set fileID [open $fname_out "w"]

dict for {key value} $dict_aa {
	set name [dict get $dict_aa $key name]
	set population [dict get $dict_aa $key population]
	set date_mod [dict get $dict_aa $key date_mod]
	puts $fileID "$key,$name,$population,$date_mod"
	}
	close $fileID
}

# ---------------------------------------------------------------
