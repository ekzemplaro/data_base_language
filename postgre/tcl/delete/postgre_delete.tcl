#! /usr/bin/tclsh
#
#	postgre_delete.tcl
#
#					Jul/16/2011
#
# ---------------------------------------------------------------
package require Pgtcl
# ---------------------------------------------------------------
puts "*** 開始 ***"
#
set id_in [lindex $argv 0]
puts $id_in
#
set con [pg_connect -conninfo [list host=localhost user=scott password=tiger dbname=city]]
#
set sql "delete from cities where id = '$id_in'"
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
