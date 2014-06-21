#! /bin/bash
#
#	derby_read.sh
#
#					Jul/06/2012
#
# ---------------------------------------------------------------------
#
export DERBY_HOME=/usr/share/javadb
export PATH="$DERBY_HOME/bin:$PATH"
#
BASH_COMMON=/var/www/data_base/common/bash_common
sql_files=$BASH_COMMON"/sql_files/derby"
# ---------------------------------------------------------------------
echo	"*** 開始 ***"
#
ij $sql_files/derby_read.sql \
	| awk '{FS="|"}{if (substr ($1,1,3) == "t35") print $1,$2,$3,$4}'
#
echo	"*** 終了 ***"
# ---------------------------------------------------------------------
