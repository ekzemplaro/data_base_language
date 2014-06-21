#! /bin/bash
#
#	epub_read.sh
#
#						Aug/20/2012
#
COMMON=/var/www/data_base/common
JAR=$COMMON/jar
#
file_epub=$1
#
echo "*** 開始 ***"
#
java -jar $JAR/tika-app-1.0.jar -t $file_epub | \
	awk '{if (substr($1,0,1) == "t")print $0}'
#
echo "*** 終了 ***"
#
