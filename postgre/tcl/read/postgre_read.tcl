#! /usr/bin/tclsh
#
#	postgre_read.tcl
#
#					Dec/21/2010
#
# ---------------------------------------------------------------
puts "*** 開始 ***"
#
package require Pgtcl

set db [pg_connect -conninfo [list host = localhost user = scott password = tiger dbname = city]]

pg_select $db "select * from cities order by id" res {
#	parray res
	puts "$res(id)\t$res(name)\t$res(population)\t$res(date_mod)"
}

pg_disconnect $db

puts "*** 終了 ***"
# ---------------------------------------------------------------
