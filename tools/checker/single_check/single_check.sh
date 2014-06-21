#! /bin/bash
#
#	single_check.sh
#
#					Jan/20/2012
#
DBASE=$1
LANG_AA=$2
KEY=$1"_"$2
#
TMP_PRE="/tmp/tmp0"
TMP_01=$TMP_PRE"1_"$KEY
TMP_02=$TMP_PRE"2_"$KEY
TMP_03=$TMP_PRE"3_"$KEY
TMP_04=$TMP_PRE"4_"$KEY
#
#echo $DBASE $LANG
CHECKER=/var/www/data_base/tools/checker
#
$CHECKER/data_prepare/data_prepare.sh $DBASE $LANG_AA
if [ $? -ne 0 ]
then
	exit 1
fi
#
$CHECKER/hantei/hantei.py $DBASE $LANG_AA $TMP_01 $TMP_02 $TMP_03 $TMP_04
#
