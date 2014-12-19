#! /bin/bash
#
#	create/derby_create.sh
#
#					Nov/28/2014
#
#
# ---------------------------------------------------------------------
#
export DERBY_BIN=/usr/share/java/derby/bin
export PATH="$DERBY_BIN:$PATH"
#
BASH_COMMON=/var/www/data_base/common/bash_common
sql_files=$BASH_COMMON"/sql_files/derby"
#
ij $sql_files/derby_create.sql
ij $sql_files/derby_insert.sql
#
