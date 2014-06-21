#! /bin/bash
#
#	cassandra_read.sh
#
#						Sep/03/2013
#
# ------------------------------------------------------------------------
WORK_FILE_A=/tmp/tmp03202.txt
#
echo 'use city;' > $WORK_FILE_A
echo 'select key,name,population,date_mod from cities;' >> $WORK_FILE_A
echo 'quit' >> $WORK_FILE_A
#
cqlsh < $WORK_FILE_A
#
rm -f $WORK_FILE_A
#
echo "*** 終了 ***"
# ------------------------------------------------------------------------
