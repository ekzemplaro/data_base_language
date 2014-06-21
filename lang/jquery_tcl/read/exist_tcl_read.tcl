#! /usr/bin/tclsh
# -*- coding: utf-8 -*-
#
#	master_tcl_read.tcl
#
#					Jan/26/2011
#
# ---------------------------------------------------------------------
proc record_create_proc {id name population date_mod tx} {
	set id_aa [join [list "\{\"id\":" $id ","] {}]
	set name_aa [join [list "\"name\":\"" $name "\","] {}]
	set population_aa [join [list "\"population\":" $population ","] {}]
	set date_mod_aa [join [list "\"date_mod\":\"" $date_mod "\"\}"] {}]
	set str_out [join [list $id_aa $name_aa $population_aa $date_mod_aa $tx] {}]
#
	return	$str_out
}

# ---------------------------------------------------------------------
puts "Content-type: text/json\n\n"

puts "\{\"cities\": \["

puts [record_create_proc 1421 横浜 98205 1982-8-24 ","]
puts [record_create_proc 1422 川崎 82158 1982-7-21 ","]
puts [record_create_proc 1423 小田原 20535 1982-6-18 ","]
puts [record_create_proc 1424 藤沢 51428 1982-3-9 ","]
puts [record_create_proc 1425 相模原 87301 1982-9-17 ","]
puts [record_create_proc 1426 厚木 47301 1982-2-28 ","]
puts [record_create_proc 1427 横須賀 51301 1982-8-12 ","]
puts [record_create_proc 1428 鎌倉 73012 1982-4-21 ","]

puts [record_create_proc 1429 逗子 24906 1982-11-21 "]"]
#
puts "\}"
#
# ---------------------------------------------------------------------
