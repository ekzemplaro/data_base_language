#! /usr/bin/tclsh8.5
#
#	xml_manipulate.tcl
#
#					Oct/14/2011
#
# ---------------------------------------------------------------
proc xml_record_create_proc {id name population date_mod} {
	set id_aa [join [list "<" $id ">"] {}]
	set name_aa [join [list "<name>" $name "</name>"] {}]
	set population_aa [join [list "<population>" $population "</population>"] {}]
	set date_mod_aa [join [list "<date_mod>" $date_mod "</date_mod>"] {}]
	set id_bb [join [list "</" $id ">"] {}]
	set str_out [join [list $id_aa $name_aa $population_aa $date_mod_aa $id_bb] {}]
#
#	puts $str_out
	return	$str_out
}

# ---------------------------------------------------------------
proc dict_to_xml_proc {dict_aa} {
	set str_xml "<?xml version=\"1.0\" encoding=\"utf-8\"?><root>"

dict for {key value} $dict_aa {
	set name [dict get $value name]
	set population [dict get $value population]
	set date_mod [dict get $value date_mod]
	puts "$key\t$name\t$population\t$date_mod"
set out_str [xml_record_create_proc $key $name $population $date_mod]
	set str_xml [join [list $str_xml $out_str]]
	}


	set str_xml [join [list $str_xml "</root>"]]

	return	$str_xml
}
# ---------------------------------------------------------------
