#! /bin/bash
#
#	tyrant_read.sh
#
#						Feb/17/2015
#
# --------------------------------------------------------------------------
BASH_COMMON=/var/www/data_base/common/bash_common
#
echo "*** 開始 ***"
#
SERVER=host_ubuntu1
PORT=1978
#
work_file_aa="/tmp/tmp0049155.txt"
work_file_bb="/tmp/tmp0049268.txt"
work_file_cc="/tmp/tmp0049379.txt"
work_file_dd="/tmp/tmp0049489.txt"
echo -n > $work_file_aa
for id in t4761 t4762 t4763 t4764 t4765 t4766 t4767 t4768 t4769
do
	data_aa="sleep 0.05; echo \"get $id\""
#
	echo $data_aa >> $work_file_aa
done
#
bash $work_file_aa | telnet $SERVER $PORT > $work_file_bb
#
egrep 'VALUE|name' $work_file_bb > $work_file_cc
#
awk '{if (NF == 4) {printf $2}else {print $0}}' $work_file_cc > $work_file_dd
#
awk -f $BASH_COMMON/awk_files/awk_json_filter $work_file_dd
#
rm -f $work_file_aa
rm -f $work_file_bb
rm -f $work_file_cc
rm -f $work_file_dd
#
echo "*** 終了 ***"
# --------------------------------------------------------------------------
