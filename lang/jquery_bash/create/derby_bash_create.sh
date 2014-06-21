#! /bin/bash
#
#	derby_bash_create.sh
#
#					Feb/08/2011
#
# ---------------------------------------------------------------
#
export DERBY_HOME=/home/uchida/data_base/derby/db-derby-10.6.2.1-bin
export PATH="$DERBY_HOME/bin:$PATH"
#
#
#
echo "Content-type: text/html"
echo ""
echo ""
#
BASH_COMMON=/var/www/data_base/common/bash_common
sql_files=$BASH_COMMON"/sql_files/derby"
#
#
ij $sql_files/derby_create.sql
ij $sql_files/derby_insert.sql
#
#
#
#
echo "*** OK ***"
#
# ---------------------------------------------------------------
