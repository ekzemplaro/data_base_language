#! /bin/bash
#
#	tcbn_read.sh
#					Jun/29/2011
#
#
# ---------------------------------------------------------------------
BASH_COMMON=/var/www/data_base/common/bash_common
#
echo "*** 開始 ***"
#
file_tcb=$1
work_file="/tmp/tmp00927.txt"
echo -n > $work_file
#
#
#
for id in t0831 t0832 t0833 t0834 t0835 t0836 t0837 t0838 t0839
do
	echo -n $id >> $work_file
	tcbmgr get $file_tcb $id | awk '{if (0 < $NF) print $0}' >> $work_file
	echo  >> $work_file
done
#
awk -f $BASH_COMMON/awk_files/awk_json_filter $work_file
#
rm -f $work_file
#
echo "*** 終了 ***"
#
# ---------------------------------------------------------------------
