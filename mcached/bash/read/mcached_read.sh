#! /bin/bash
#
#	mcached_read.sh
#
#						Oct/06/2014
#
# --------------------------------------------------------------------------
BASH_COMMON=/var/www/data_base/common/bash_common
#
echo "*** 開始 ***"
#
#
work_file="/tmp/tmp00236.txt"
echo -n > $work_file
for id in t1731 t1732 t1733 t1734 t1735 t1736 t1737 t1738 t1739
do
	data_aa=`memcat --servers=localhost:11211 $id`
#
	echo -n $id >> $work_file

	echo $data_aa >> $work_file
done
#
awk -f $BASH_COMMON/awk_files/awk_json_filter $work_file
#
rm -f $work_file
echo "*** 終了 ***"
# --------------------------------------------------------------------------
