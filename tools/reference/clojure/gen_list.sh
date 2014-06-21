#
REF=/var/www/data_base/tools/reference
BIN=$REF/bin
WORK_FILE=/tmp/tmp00218
#
grep load-file */*.clj | awk '{print $2}' | \
	$BIN/go_clear.sh | awk -F "/" '{print $NF}'>  $WORK_FILE
cat $REF/clojure/common.txt $WORK_FILE | sort | uniq -d > reference.txt
#
#
grep load-file */*.clj | awk '{print $2}' >> /tmp/t06
grep load-file */*.clj | awk '{print $2}' | \
	$BIN/go_clear.sh >> /tmp/t07
grep load-file */*.clj | awk '{print $2}' | \
	$BIN/go_clear.sh | awk -F "/" '{print $NF}'>> /tmp/t09
