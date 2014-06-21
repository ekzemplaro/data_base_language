#! /bin/bash
#
#	cdb_read.sh
#
#						May/29/2012
#
# --------------------------------------------------------------------------
BASH_COMMON=/var/www/data_base/common/bash_common
#
echo "*** 開始 ***"
#
#
work_file="/tmp/tmp00548.txt"
echo -n > $work_file
for key in t2761 t2762 t2763 t2764 t2765 t2766 t2767 t2768 t2769
do
	echo -n $key >> $work_file
	cdbget $key < /var/tmp/cdb/cities.cdb >> $work_file
	echo >> $work_file
done
#
#cat $work_file
awk -f $BASH_COMMON/awk_files/awk_json_filter $work_file
#
#rm -f $work_file
echo "*** 終了 ***"
# --------------------------------------------------------------------------
