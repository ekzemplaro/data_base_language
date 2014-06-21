#! /usr/bin/tclsh8.5
#
#	berekeley_read.tcl
#
#					Aug/23/2013
# ---------------------------------------------------------------
#
load /usr/lib/x86_64-linux-gnu/libdb_tcl.so
#
package require Db_tcl
package require json
#
# ---------------------------------------------------------------
proc record_parser value {
	set value_bb [encoding convertfrom utf-8 $value]
#	puts $value_bb
	regsub  -- {t} $value_bb \"t value_cc
	regsub -all -- { \{\{} $value_cc \":\{ value_dd
	regsub  -- {\}\}\}} $value_dd \}\} value_ee
#	puts $value_ee
	set unit_aa [json::json2dict $value_dd]
	dict for {key value} $unit_aa {
#		puts $key
		set name [dict get $value name]
	set population [dict get $value population]
	set date_mod [dict get $value date_mod]
	puts [format "%s\t%s\t%s\t%s" $key $name $population $date_mod]
		}
}

# ---------------------------------------------------------------
puts "*** 開始 ***"
set fname_in [lindex $argv 0]
set vvv [berkdb version -string]
puts $vvv
#
berkdb open $fname_in
db0 cursor
#
#
while {true} {
	set value [db0.c0 get -next]
#
	if {0 < [string length $value]} {
		record_parser $value
	} else {
		break
		}
	}
#
db0 close
puts "*** 終了 ***"
# ---------------------------------------------------------------
