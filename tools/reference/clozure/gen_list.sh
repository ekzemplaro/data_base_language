#
REF=/var/www/data_base/tools/reference
REF_HOME=$REF/clozure
BIN=$REF/bin
WORK_FILE_AA=/tmp/tmp00312
WORK_FILE_BB=/tmp/tmp00313
WORK_FILE_CC=/tmp/tmp00314

#
rm -f $WORK_FILE_AA
#
awk -F "." '{print "grep " $1 " */*.lisp"}' $REF_HOME"/common.txt" > $WORK_FILE_AA
#
bash $WORK_FILE_AA | egrep 'load' > $WORK_FILE_BB
$BIN/pick_up.js $REF_HOME"/common.txt" $WORK_FILE_BB  > $WORK_FILE_CC
#
awk '{print $1".lisp"}' $WORK_FILE_CC > reference.txt
#
#
#
awk -F "." '{print "grep " $1 " */*.lisp"}' $REF_HOME"/common.txt" >> /tmp/t01
#
bash $WORK_FILE_AA | egrep 'load' >> /tmp/t02
$BIN/pick_up.js $REF_HOME"/common.txt" $WORK_FILE_BB  >> /tmp/t03
