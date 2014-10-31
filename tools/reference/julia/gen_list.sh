#
REF=/var/www/data_base/tools/reference
BIN=$REF/bin
WORK_FILE=/tmp/tmp00218
#
grep "include" */*.jl | awk '{print $2}' | $BIN/go_clear.sh > $WORK_FILE
#
#
cat $REF/julia/common.txt $WORK_FILE | sort | uniq -d > reference.txt
#
