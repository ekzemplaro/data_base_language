#! /bin/bash
#
#	txt_to_json.sh
#
#					Feb/07/2011
#
#
#
#
BASH_COMMON="/var/www/data_base/common/bash_common"
awk_file=$BASH_COMMON"/awk_files/awk_to_json"
#
#
awk -f $awk_file
#
#
