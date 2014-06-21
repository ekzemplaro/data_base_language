#
REF=/var/www/data_base/tools/reference
REF_HOME=$REF/groovy
BIN=$REF/bin
WORK_FILE_AA=/tmp/tmp00312
WORK_FILE_BB=/tmp/tmp00313
WORK_FILE_CC=/tmp/tmp00314
WORK_FILE_DD=/tmp/tmp00315

#
rm -f $WORK_FILE_AA
#
awk -F "." '{print "grep " $1 " */*.groovy"}' $REF_HOME"/common.txt" > $WORK_FILE_AA
#
bash $WORK_FILE_AA | egrep 'new|import' > $WORK_FILE_BB
$BIN/pick_up.js $REF_HOME"/common.txt" $WORK_FILE_BB  > $WORK_FILE_CC
#cp $WORK_FILE_CC reference.txt
awk '{print $1".groovy"}' $WORK_FILE_CC > reference.txt

#
#awk -F "." '{print $(NF-1)}' $WORK_FILE_BB | awk '{print $NF}' > $WORK_FILE_CC
#awk -F "=" '{print $NF".scala"}'  $WORK_FILE_CC >  $WORK_FILE_DD
#cat $REF_HOME/common.txt $WORK_FILE_DD | sort | uniq -d > reference.txt
#
#
awk -F "." '{print "grep " $1 " */*.groovy"}' $REF_HOME"/common.txt" >> /tmp/t02
bash $WORK_FILE_AA | egrep 'new|import' >> /tmp/t03
$BIN/pick_up.js $REF_HOME"/common.txt" $WORK_FILE_BB  >> /tmp/t04
awk '{print $0".groovy"}' $WORK_FILE_CC | sort | uniq -d >> /tmp/t05
#
#awk -F "." '{print $(NF-1)}' $WORK_FILE_BB | awk '{print $NF}' >> /tmp/t04
#awk -F "=" '{print $NF}'  $WORK_FILE_CC >> /tmp/t05
