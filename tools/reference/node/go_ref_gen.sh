#
REF=/var/www/data_base/tools/reference
BIN=$REF/bin
SRC=$REF/node
$SRC/gen_list_node.sh
$BIN/to_json.js
#
