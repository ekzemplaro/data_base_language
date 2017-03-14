#! /bin/bash
#
#	process_db.sh
#
#					Mar/14/2017
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
for db in text csv xml json calc excel pdf epub \
	sqlite3 oracle mssql db2 mysql postgre \
	firebird drizzle derby hsqldb h2  \
	xindice exist dbxml gdbm berkeley cdb \
	mcached mcachedb redis tcbn tyrant \
	couch ftp webdav mongo cassandra voltdb hbase voldemort neo4j \
	hgdb riak xlsx maria pouch
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
