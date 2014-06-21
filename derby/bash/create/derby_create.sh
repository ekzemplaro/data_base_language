#! /bin/bash
#
#	derby_create.sh
#
#					Jul/06/2012
#
#
export DERBY_HOME=/usr/share/javadb
export PATH="$DERBY_HOME/bin:$PATH"
#
BASH_COMMON=/var/www/data_base/common/bash_common
sql_files=$BASH_COMMON"/sql_files/derby"
#
ij $sql_files/derby_create.sql
ij $sql_files/derby_insert.sql
#
