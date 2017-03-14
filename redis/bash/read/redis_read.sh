#! /bin/bash
#
#	redis_read.sh
#
#						Mar/15/2017
#
# --------------------------------------------------------------------------
BASH_COMMON=/var/www/data_base/common/bash_common
#
echo "*** 開始 ***"
#
hostname="localhost"
work_file="/tmp/tmp0025.txt"
echo -n > $work_file
for id in t1851 t1852 t1853 t1854 t1855 t1856 t1857 t1858 t1859
do
	echo -n $id >> $work_file
	redis-cli -h $hostname -p 6379 get $id >> $work_file
	echo  >> $work_file
done
#
awk -f $BASH_COMMON/awk_files/awk_json_filter $work_file
#
rm -f $work_file
echo "*** 終了 ***"
# --------------------------------------------------------------------------
