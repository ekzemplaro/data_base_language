#! /bin/bash
#
#	firebird_read.sh
#
#				May/30/2011
#
# ---------------------------------------------------------------------
#
BASH_COMMON=/var/www/data_base/common/bash_common
sql_files=$BASH_COMMON"/sql_files/firebird"
#
echo "*** 開始 ***"
#
isql-fb -q -i $sql_files/firebird_read.sql \
	| awk '{if (substr ($1,1,3) == "t38") print $1,$2,$3,$4}'
#
echo "*** 終了 ***"
# ---------------------------------------------------------------------
