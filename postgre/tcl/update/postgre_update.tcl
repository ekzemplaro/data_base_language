#! /usr/bin/tclsh
#
#	postgre_update.tcl
#
#					Jul/16/2011
#
# ---------------------------------------------------------------
package require Pgtcl
# ---------------------------------------------------------------
puts "*** 開始 ***"
#
set id_in [lindex $argv 0]
set population_in [lindex $argv 1]
puts $id_in
puts $population_in
set date_mod '[clock format [clock seconds] -format {%Y-%m-%d}]'
#
set con [pg_connect -conninfo [list host = localhost user = scott password = tiger dbname = city]]
#
set sql "update cities set population = $population_in, date_mod = $date_mod  where id = '$id_in'"
puts $sql
#
pg_exec $con $sql
#set rowcount [pg_exec $con $sql]
#puts "${rowcount} are changed."

pg_disconnect $con
#
puts "*** 終了 ***"
#
# ---------------------------------------------------------------
