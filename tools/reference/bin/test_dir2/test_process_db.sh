#! /bin/bash
#
#	process_db.sh
#
#					May/15/2020
#
DATA_BASE=/var/www/data_base
BIN=$DATA_BASE"/tools/reference/bin"
#
lang=$1
suffix=$2
file_common=$3
#
GO_REF=$DATA_BASE"/tools/reference/"$lang"/gen_list.sh"
$BIN/gen_common.sh $lang $suffix $file_common
#
for db in text
do
	folder=$DATA_BASE"/"$db"/"$lang
	if [ -d $folder ]
	then
		cd $folder
		$GO_REF
		$BIN/to_json.js reference.txt reference.json
	fi
done
#
