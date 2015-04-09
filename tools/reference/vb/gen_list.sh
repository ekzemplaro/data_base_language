#
REF=/var/www/data_base/tools/reference
REF_HOME=$REF/vb
BIN=$REF/bin
WORK_FILE_AA=/tmp/tmp00612
WORK_FILE_BB=/tmp/tmp00613
WORK_FILE_CC=/tmp/tmp00614

#
rm -f $WORK_FILE_AA
#
awk -F "." '{print "grep " $1 " */Makefile"}' $REF_HOME"/common.txt" > $WORK_FILE_AA
#
bash $WORK_FILE_AA > $WORK_FILE_BB
$BIN/pick_up.js $REF_HOME"/common.txt" $WORK_FILE_BB  > $WORK_FILE_CC
#
awk '{print $1".vb"}' $WORK_FILE_CC > reference.txt
#
#
