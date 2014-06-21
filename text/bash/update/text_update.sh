#! /bin/bash
#
#	text_update.sh
#					May/20/2013
#
# ----------------------------------------------------------------
AWK_FILES=/var/www/data_base/common/bash_common/awk_files
file_tmp="/tmp/tmp00015.txt"
file_out=$1
id_in=$2
population_in=$3
#
echo "*** 開始 ***"
echo $id_in
echo $population_in
today=`date '+%F'`
#
awk -v id_in=$id_in -v population_in=$population_in -v today=$today \
	-f $AWK_FILES/awk_text_update $file_out > $file_tmp
cp $file_tmp $file_out
#
rm -f $file_tmp
#
echo $today
echo "*** 終了 ***"
# ----------------------------------------------------------------
