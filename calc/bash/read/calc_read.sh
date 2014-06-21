#! /bin/bash
#
#	calc_read.sh
#					Feb/22/2011
#
# --------------------------------------------------------
AWK_CALC_FILTER=/var/www/data_base/common/bash_common/awk_files/awk_calc_filter
echo "*** 開始 ***"
#
odt2txt $1 | awk '{if (0 < NF) print $0}' \
 | awk -f $AWK_CALC_FILTER
#
echo "*** 終了 ***"
# --------------------------------------------------------
