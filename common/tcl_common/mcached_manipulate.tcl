#
#	mcached_manipulate.tcl
#
#					Feb/11/2015
#
# ---------------------------------------------------------------
proc mcached_set_proc {io key value} {
	set llx [string bytelength $value]
	puts $llx
	puts $value
	set command [join [list "set " $key " 0 0 " $llx] {}]
	puts $command
	puts $io $command
	puts $io $value
	flush $io
	set res [gets $io]
	puts $res
}

# ---------------------------------------------------------------
proc mcached_to_dict_proc {server port array_keys} {
	set io [socket $server $port]
	upvar $array_keys keys
	set dict_aa [dict create]
#
	foreach xx [array names keys] {
		set key $keys($xx)
		puts $io "get $key"
		flush $io
		set aa [gets $io]
		if {$aa != "END"} {
			set json_str [gets $io]
			set cc [gets $io]
			set unit_aa [json::json2dict $json_str]
			set name [dict get $unit_aa name]
			set population [dict get $unit_aa population]
			set date_mod [dict get $unit_aa date_mod]
			set dict_aa [dict_append_proc $dict_aa $key $name $population $date_mod]
		}
	}

	close $io

	return	$dict_aa
}

# ---------------------------------------------------------------
proc mcached_update_proc {server port key_in population_in} {
	set io [socket $server $port]
#
	puts $io "get $key_in"
	flush $io
	set aa [gets $io]
	if {$aa != "END"} {
		set json_str [gets $io]
		set cc [gets $io]
#
		set json_new [json_str_update_proc $json_str $population_in]
		mcached_set_proc $io $key_in $json_new
	}
#
	close $io
}

# ---------------------------------------------------------------
proc mcached_delete_proc {server port key_in} {
	set io [socket $server $port]
	puts $io "delete $key_in"
	close $io
}

# ---------------------------------------------------------------
proc dict_to_mcached_proc  {server port dict_aa} {
	set io [socket $server $port]
#
	dict for {key value} $dict_aa {
		puts $key
#
		set json_str [json_unit_record_create_proc $value]
		puts $json_str
		mcached_set_proc $io $key $json_str
	}
#
	close $io
}

# ---------------------------------------------------------------
