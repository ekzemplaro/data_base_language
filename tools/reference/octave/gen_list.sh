#
REF=/var/www/data_base/tools/reference
BIN=$REF/bin
WORK_FILE=/tmp/tmp00239
#
grep "proc" */*.m | awk '{print $2}' | $BIN/go_clear.sh > $WORK_FILE
#
#
sed 's/.m//' $REF/octave/common.txt >> $WORK_FILE
cat $WORK_FILE | sort | uniq -d | awk '{print $0".m"}' > reference.txt
#
