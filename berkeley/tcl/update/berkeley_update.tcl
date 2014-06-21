#! /usr/bin/tclsh8.5
# ---------------------------------------------------------------
#	berkeley_update.tcl
#
#					Aug/29/2013
#
# ---------------------------------------------------------------
load /usr/lib/x86_64-linux-gnu/libdb_tcl.so
package require Db_tcl
package require json
source /var/www/data_base/common/tcl_common/json_manipulate.tcl
# ---------------------------------------------------------------
proc str_update_proc {value_in population_in} {
	set str_out ""
	puts $value_in
	set value_bb $value_in
	puts $value_bb
	regsub  -- {t} $value_bb \"t value_cc
	regsub -all -- { \{\{} $value_cc \":\{ value_dd
#	puts $value_dd
	set unit_aa [json::json2dict $value_dd]
#
	dict for {key value} $unit_aa {
		puts "key = $key"
		puts "value = $value"
		set name [dict get $value name]
		puts "name = $name"
		puts "population = $population_in"
		set today [clock format [clock seconds] -format {%Y-%m-%d}]
		puts "today = $today"
		set name_aa [join [list "\{\"name\":\"" $name "\","] {}]
	set population_aa [join [list "\"population\":" $population_in ","] {}]
	set date_mod_aa [join [list "\"date_mod\":\"" $today "\"\}"] {}]
	set str_out [join [list $name_aa $population_aa $date_mod_aa] {}]

		}
	return	$str_out
}
#
#	set unit_aa [json::json2dict $value_in]
#		puts $key
#		set name [dict get $value name]
#	set population [dict get $value population]
#	set date_mod [dict get $value date_mod]
#	puts [format "%s\t%s\t%s\t%s" $key $name $population $date_mod]
#		}
# ---------------------------------------------------------------
#
puts "*** 開始 ***"
set fname_in [lindex $argv 0]
set key_in [lindex $argv 1]
set population_in [lindex $argv 2]
puts $fname_in
puts $key_in
puts $population_in
#
set vvv [berkdb version -string]
puts $vvv
#
berkdb open $fname_in
set value [db0 get $key_in]
set llx [string length $value]
if {0 < $llx} {
	puts $value
#	set str_out [json_str_update_proc $value $population_in]
	set str_out [str_update_proc $value $population_in]
	puts $str_out
	db0 put $key_in $str_out
	}
#
db0 close
puts "*** 終了 ***"
# ---------------------------------------------------------------
