#
REF=/var/www/data_base/tools/reference
REF_HOME=$REF/haxe
BIN=$REF/bin
WORK_FILE_AA=/tmp/tmp00432
WORK_FILE_BB=/tmp/tmp00433
WORK_FILE_CC=/tmp/tmp00434
WORK_FILE_DD=/tmp/tmp00435
#
#
rm -f $WORK_FILE_AA
#
ls */*.hx > $WORK_FILE_AA
awk -F "/" '{print "grep " $1 " /tmp/tmp00432"}' $REF_HOME"/common.txt" > $WORK_FILE_BB
#
bash $WORK_FILE_BB > $WORK_FILE_CC
$BIN/pick_up.js $REF_HOME"/common.txt" $WORK_FILE_CC  > $WORK_FILE_DD
#
awk '{print $1".hx"}' $WORK_FILE_DD > reference.txt
#
#
#
#
