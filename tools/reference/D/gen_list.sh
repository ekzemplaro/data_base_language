#
REF=/var/www/data_base/tools/reference
REF_HOME=$REF/D
BIN=$REF/bin
WORK_FILE_AA=/tmp/tmp00312
WORK_FILE_BB=/tmp/tmp00313
WORK_FILE_CC=/tmp/tmp00314
WORK_FILE_DD=/tmp/tmp00315

#
rm -f $WORK_FILE_AA
#
awk -F "." '{print "grep " $1 " */*.d"}' $REF_HOME"/common.txt" > $WORK_FILE_AA
#
bash $WORK_FILE_AA | egrep 'import' > $WORK_FILE_BB
$BIN/pick_up.js $REF_HOME"/common.txt" $WORK_FILE_BB  > $WORK_FILE_CC
#
awk '{print $1".d"}' $WORK_FILE_CC > reference.txt
#
#
#
awk -F "." '{print "grep " $1 " */*.d"}' $REF_HOME"/common.txt" >> /tmp/t01
#
bash $WORK_FILE_AA | egrep 'import' >> /tmp/t02
$BIN/pick_up.js $REF_HOME"/common.txt" $WORK_FILE_BB  >> /tmp/t03
