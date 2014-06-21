#
REF=/var/www/data_base/tools/reference
BIN=$REF/bin
WORK_FILE=/tmp/tmp00219
#
grep "load" */*.fal | grep "common" | grep "falcon" | awk '{print $2}' | \
	$BIN/go_clear.sh | awk -F "/" '{print $NF}' >  $WORK_FILE
#
cat $REF/falcon/common.txt $WORK_FILE | sort | uniq > reference.txt
#
