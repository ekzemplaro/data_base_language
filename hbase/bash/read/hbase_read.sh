export HBASE_INSTALL=/home/uchida/dbm/hbase/hbase-0.96.0-hadoop2
export PATH=$PATH:$HBASE_INSTALL/bin
#
hbase shell << EOF
scan 'cities'
quit
EOF
