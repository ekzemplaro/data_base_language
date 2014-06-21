#! /usr/bin/tclsh
#
#	mysql_create.tcl
#
#					Jul/16/2011
#
# ---------------------------------------------------------------
package require mysqltcl
# ---------------------------------------------------------------
proc insert_proc {con id name population date_mod} {
set sql "insert into cities set id=$id,name=$name,population=$population,date_mod=$date_mod"
mysqlexec $con $sql
}

# ---------------------------------------------------------------
puts "*** 開始 ***"
#
set con [mysqlconnect -host host_mysql -port 3306 \
  -user scott -password tiger -db city -encoding utf-8]
#
mysqlexec $con "set NAMES utf8"
#
set sql "drop table cities"
mysqlexec $con $sql
set sql "create table cities (id varchar(10) primary key, name text, population int, date_mod date)"
mysqlexec $con $sql
#
insert_proc $con 't3321' '岡山' 45976 '1982-3-15'
insert_proc $con 't3322' '倉敷' 71342 '1982-8-14'
insert_proc $con 't3323' '津山' 17687 '1982-9-17'
insert_proc $con 't3324' '玉野' 82169 '1982-2-19'
insert_proc $con 't3325' '笠岡' 39251 '1982-5-7'
insert_proc $con 't3326' '井原' 65934 '1982-10-23'
insert_proc $con 't3327' '総社' 58923 '1982-6-15'
insert_proc $con 't3328' '高梁' 23819 '1982-11-28'
insert_proc $con 't3329' '新見' 14325 '1982-4-22'
#
#
#set rowcount [mysqlexec $con $sql]
#puts "${rowcount} are changed."

mysqlclose $con
#
puts "*** 終了 ***"
#
# ---------------------------------------------------------------
