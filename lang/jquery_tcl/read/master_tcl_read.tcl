#! /usr/bin/tclsh
# -*- coding: utf-8 -*-
#
#	master_tcl_read.tcl
#
#					May/27/2011
#
# ---------------------------------------------------------------------
proc record_create_proc {id name population date_mod tx} {
	set id_aa [join [list "\"" $id "\": \{"] {}]
	set name_aa [join [list "\"name\":\"" $name "\","] {}]
	set population_aa [join [list "\"population\":" $population ","] {}]
	set date_mod_aa [join [list "\"date_mod\":\"" $date_mod "\"\}"] {}]
	set str_out [join [list $id_aa $name_aa $population_aa $date_mod_aa $tx] {}]
#
	return	$str_out
}

# ---------------------------------------------------------------------
puts "Content-type: text/json\n\n"

puts "\{"

puts [record_create_proc t0421 仙台 98205 1982-8-24 ","]
puts [record_create_proc t0422 石巻 82158 1982-7-21 ","]
puts [record_create_proc t0423 塩竈 20535 1982-6-18 ","]
puts [record_create_proc t0424 気仙沼 51428 1982-3-9 ","]
puts [record_create_proc t0425 白石 87301 1982-9-17 ","]
puts [record_create_proc t0426 名取 47301 1982-2-28 ","]
puts [record_create_proc t0427 多賀城 51301 1982-8-12 ","]
puts [record_create_proc t0428 岩沼 73012 1982-4-21 ","]

puts [record_create_proc t0429 大崎 24906 1982-11-21 "}"]
#
#
# ---------------------------------------------------------------------
