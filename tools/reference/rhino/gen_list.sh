#
REF=/var/www/data_base/tools/reference
BIN=$REF/bin
#
grep load */*.js | awk '{print $2}' | \
	$BIN/go_clear.sh > reference.txt
#
