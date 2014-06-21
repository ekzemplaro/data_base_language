#
REF=/var/www/data_base/tools/reference
BIN=$REF/bin
WORK_FILE=/tmp/tmp00215
#
grep from */*.py | grep "import" | grep -v '*'| awk '{print $2}' | \
	$BIN/go_clear.sh | awk '{print $0".py"}' >  $WORK_FILE
cat $REF/python/common.txt $WORK_FILE | sort | uniq -d > reference.txt
#
