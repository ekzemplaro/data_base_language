#
REF=/var/www/data_base/tools/reference
BIN=$REF/bin
WORK_FILE=/tmp/tmp00217
#
grep use */*.pl | awk '{print $2}' | \
	$BIN/go_clear.sh | awk '{print $0".pm"}' >  $WORK_FILE
cat $REF/perl/common.txt $WORK_FILE | sort | uniq -d > reference.txt
#
