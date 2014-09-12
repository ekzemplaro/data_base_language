#! /bin/bash
#
#	json_delete.sh
#
#					Aug/21/2014
#
# ---------------------------------------------------------------
BASH_COMMON=/var/www/data_base/common/bash_common
AWK_FILES=$BASH_COMMON"/awk_files"
# ---------------------------------------------------------------
echo "*** 開始 ***"
file_json=$1
key_in=$2
echo $key_in
#
../read/json_read.sh $file_json | \
awk '{if (substr ($1,1,1) == "t") print $0}' | \
awk -v id_in=$key_in -f $AWK_FILES/awk_text_delete | \
$BASH_COMMON/txt_to_json.sh
echo "*** 終了 ***"
#
# ---------------------------------------------------------------
