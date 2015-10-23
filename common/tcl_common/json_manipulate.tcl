#! /usr/bin/tclsh8.5
#
#	json_manipulate.tcl
#
#					Aug/29/2013
#
# ---------------------------------------------------------------
package require json
#
# ---------------------------------------------------------------
proc json_record_create_proc {id name population date_mod tx} {
	set id_aa [join [list "\"" $id "\": \{"] {}]
	set name_aa [join [list "\"name\":\"" $name "\","] {}]
	set population_aa [join [list "\"population\":" $population ","] {}]
	set date_mod_aa [join [list "\"date_mod\":\"" $date_mod "\"\}"] {}]
	set str_out [join [list $id_aa $name_aa $population_aa $date_mod_aa $tx] {}]
#
#	puts $str_out
	return	$str_out
}

# ---------------------------------------------------------------
proc json_unit_record_create_proc {unit_aa} {
	set name [dict get $unit_aa name]
	set population [dict get $unit_aa population]
	set date_mod [dict get $unit_aa date_mod]
#
	set name_aa [join [list "\{\"name\":\"" $name "\","] {}]
	set population_aa [join [list "\"population\":" $population ","] {}]
	set date_mod_aa [join [list "\"date_mod\":\"" $date_mod "\"\}"] {}]
	set str_out [join [list $name_aa $population_aa $date_mod_aa] {}]
#
#	puts $str_out
	return	$str_out
}
# ---------------------------------------------------------------
proc dict_to_json_proc {dict_aa} {
	set str_json "\{"

dict for {key value} $dict_aa {
	set name [dict get $value name]
	set population [dict get $value population]
	set date_mod [dict get $value date_mod]
	set out_str [json_record_create_proc $key $name $population $date_mod ","]
	set str_json [join [list $str_json $out_str]]
	}

set ll [string length $str_json]
puts $ll
set llx [expr $ll - 2]
set str_json [string range $str_json 0 $llx]
set str_json [join [list $str_json "\}"]]

	return	$str_json
}

# ---------------------------------------------------------------
proc json_str_update_proc {json_str population_in} {
	set unit_aa [json::json2dict $json_str]
	set name [dict get $unit_aa name]
	set population [dict get $unit_aa population]
	set date_mod [dict get $unit_aa date_mod]
	puts [format "%s\t%s\t%s" $name $population $date_mod]

	set today [clock format [clock seconds] -format {%Y-%m-%d}]
	puts "today = $today"
#
	set name_aa [join [list "\{\"name\":\"" $name "\","] {}]
	set population_aa [join [list "\"population\":" $population_in ","] {}]
	set date_mod_aa [join [list "\"date_mod\":\"" $today "\"\}"] {}]
	set str_out [join [list $name_aa $population_aa $date_mod_aa] {}]
#
	return	$str_out
}

# ---------------------------------------------------------------
