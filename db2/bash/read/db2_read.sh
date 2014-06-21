#! /bin/bash
#
#	db2_read.sh
#
#					Feb/08/2011
#
# -----------------------------------------------------
#
SQLDIR=/var/www/data_base/common/bash_common/sql_files/db2
#
echo	"*** 開始 ***"
#
db2 -tsf $SQLDIR/db2_read.sql 
#
echo	"*** 終了 ***"
