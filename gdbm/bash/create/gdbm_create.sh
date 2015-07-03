#! /bin/bash
#
#	gdbm_create.sh
#
#						Jun/09/2015
#
# --------------------------------------------------------------------------
#
BASH_COMMON=/var/www/data_base/common/bash_common
#
DBM_FILE=$1
#
echo "*** 開始 ***"
#
cd /tmp
dbm replace $DBM_FILE t2151 '{"name":"岐阜","population":69153,"date_mod":"2001-5-12"}'
dbm replace $DBM_FILE t2152 '{"name":"大垣","population":31247,"date_mod":"2001-7-18"}'
dbm replace $DBM_FILE t2153 '{"name":"多治見","population":54671,"date_mod":"2001-9-2"}'
dbm replace $DBM_FILE t2154 '{"name":"各務原","population":95613,"date_mod":"2001-8-14"}'
dbm replace $DBM_FILE t2155 '{"name":"土岐","population":32167,"date_mod":"2001-9-4"}'
dbm replace $DBM_FILE t2156 '{"name":"高山","population":93524,"date_mod":"2001-10-17"}'
dbm replace $DBM_FILE t2157 '{"name":"美濃加茂","population":81376,"date_mod":"2001-11-24"}'
dbm replace $DBM_FILE t2158 '{"name":"恵那","population":57428,"date_mod":"2001-12-21"}'
dbm replace $DBM_FILE t2159 '{"name":"関","population":62174,"date_mod":"2001-7-17"}'
dbm replace $DBM_FILE t2160 '{"name":"中津川","population":73492,"date_mod":"2001-8-21"}'
#
#
echo "*** 終了 ***"
#
# --------------------------------------------------------------------------
