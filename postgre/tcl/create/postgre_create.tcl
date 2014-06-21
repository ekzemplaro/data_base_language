#! /usr/bin/tclsh
#
#	postgre_create.tcl
#
#					Jul/16/2011
#
# ---------------------------------------------------------------
package require Pgtcl
# ---------------------------------------------------------------
puts "*** 開始 ***"
#
#
set con [pg_connect -conninfo [list host = localhost user = scott password = tiger dbname = city]]
#
set sql "drop table cities"
pg_exec $con $sql
set sql "create table cities (id varchar(10) primary key, name text, population int, date_mod date)"
pg_exec $con $sql
#
set sql "insert into cities values ('t3461','広島',85672,'1982-6-14')"
pg_exec $con $sql
set sql "insert into cities values ('t3462','福山',71891,'1982-7-11')"
pg_exec $con $sql
set sql "insert into cities values ('t3463','東広島',53413,'1982-6-12')"
pg_exec $con $sql
set sql "insert into cities values ('t3464','呉',43167,'1982-9-29')"
pg_exec $con $sql
set sql "insert into cities values ('t3465','尾道',35924,'1982-3-18')"
pg_exec $con $sql
set sql "insert into cities values ('t3466','竹原',22314,'1982-2-21')"
pg_exec $con $sql
set sql "insert into cities values ('t3467','三次',15152,'1982-8-16')"
pg_exec $con $sql
set sql "insert into cities values ('t3468','大竹',33518,'1982-7-7')"
pg_exec $con $sql
set sql "insert into cities values ('t3469','府中',46529,'1982-10-9')"
pg_exec $con $sql
#
#set rowcount [pg_exec $con $sql]
#puts "${rowcount} are changed."

pg_disconnect $con
#
puts "*** 終了 ***"
#
# ---------------------------------------------------------------
