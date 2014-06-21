#! /bin/bash
#
#	text_delete.sh
#					May/20/2013
#
# ------------------------------------------------------------
#
AWK_FILES=/var/www/data_base/common/bash_common/awk_files
file_tmp="/tmp/tmp000194.txt"
file_out=$1
id_in=$2
#
echo "*** 開始 ***"
echo $id_in
#
awk -v id_in=$id_in \
	-f $AWK_FILES/awk_text_delete $file_out > $file_tmp
cp $file_tmp $file_out
#
rm -f $file_tmp
#
echo "*** 終了 ***"
# ------------------------------------------------------------
