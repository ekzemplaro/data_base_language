#! /usr/bin/tclsh
#
#	maria_update.tcl
#
#					Nov/17/2014
#
# ---------------------------------------------------------------
package require mysqltcl
# ---------------------------------------------------------------
puts "*** 開始 ***"
#
set id_in [lindex $argv 0]
set population_in [lindex $argv 1]
puts $id_in
puts $population_in
set date_mod '[clock format [clock seconds] -format {%Y-%m-%d}]'
#
set con [mysqlconnect -host localhost -port 3306 \
  -user scott -password tiger -db city -encoding utf-8]
#
#mysqlexec $con "set NAMES utf8"
#
set sql "update cities set population = $population_in, date_mod = $date_mod  where id = '$id_in'"

puts $sql
set rowcount [mysqlexec $con $sql]
puts "${rowcount} are changed."

mysqlclose $con
#
puts "*** 終了 ***"
#
# ---------------------------------------------------------------
