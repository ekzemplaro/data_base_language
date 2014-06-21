#! /bin/bash
#
#	cassandra_bash_read.sh
#
#					Nov/06/2013
#
# ------------------------------------------------------------------------
#
#
#
DATA_BASE=/var/www/data_base
BASH_COMMON=$DATA_BASE"/common/bash_common"
cassandra_read=$DATA_BASE"/cassandra/bash/read"
#
export PATH=$PATH:/home/uchida/dbm/cassandra/apache-cassandra-2.0.2/bin
#
echo "Content-type: text/json"
echo ""
echo ""
#
$cassandra_read/cassandra_read.sh \
	| sed 's/|//g' \
	| awk '{if (substr($1,1,1) == "t") print $1,$2,$3,$4}'\
	| $BASH_COMMON/txt_to_json.sh
#
#
