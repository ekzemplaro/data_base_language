#! /bin/bash
#
#	gdbm_read.sh
#
#						Jun/09/2015
#
# --------------------------------------------------------------------------
#
BASH_COMMON=/var/www/data_base/common/bash_common
#
DBM_FILE=$1
WORK_FILE="/tmp/tmp00397.txt"
#
echo "*** 開始 ***"
#
list=`dbm list $DBM_FILE 0`
# dbm list $DBM_FILE 0
#
# for key in "t2151" "t2152" "t2153"
for key in $list
do
	echo -n -e $key"\t" > $WORK_FILE
	name=`dbm get $DBM_FILE $key | jq .name`
	population=`dbm get $DBM_FILE $key | jq .population`
	date_mod=`dbm get $DBM_FILE $key | jq .date_mod`
	echo -n -e $name"\t" >> $WORK_FILE
	echo -n -e $population"\t" >> $WORK_FILE
	echo $date_mod >> $WORK_FILE
	cat $WORK_FILE
done
#
rm -f $WORK_FILE
#
echo "*** 終了 ***"
#
# --------------------------------------------------------------------------
