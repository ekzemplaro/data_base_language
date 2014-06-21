#
REF=/var/www/data_base/tools/reference
REF_HOME=$REF/haskell
BIN=$REF/bin
WORK_FILE_AA=/tmp/tmp00432
WORK_FILE_BB=/tmp/tmp00433
WORK_FILE_CC=/tmp/tmp00434

#
rm -f $WORK_FILE_AA
#
awk -F "." '{print "grep " $1 " */*.hs"}' $REF_HOME"/common.txt" > $WORK_FILE_AA
#
bash $WORK_FILE_AA > $WORK_FILE_BB
$BIN/pick_up.js $REF_HOME"/common.txt" $WORK_FILE_BB  > $WORK_FILE_CC
#
awk '{print $1".hs"}' $WORK_FILE_CC > reference.txt
#
#
