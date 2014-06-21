#! /bin/bash
#
#	db2_create.sh
#
#					Feb/08/2011
#
# -----------------------------------------------------
SQLDIR=/var/www/data_base/common/bash_common/sql_files/db2
#
db2 -tsf  $SQLDIR/db2_create.sql 
db2 -tsf  $SQLDIR/db2_insert.sql 
