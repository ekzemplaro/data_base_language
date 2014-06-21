#! /bin/bash
#
#	data_prepare.sh
#
#					Jan/20/2012
#
HOME_PT="/var/www/data_base/"$1"/"$2
READ=$HOME_PT/read
KEY=$1"_"$2
#
rm -f "/tmp/tmp*"$KEY
#
# -------------------------------------------------------
for folder in create read update delete
do
	cd $HOME_PT"/"$folder
	if [ -e ./Makefile ]
	then
		make clean > /tmp/tmp098
		make > /tmp/tmp099
	fi
done
# -------------------------------------------------------
cd $HOME_PT/create
./gox > /tmp/tmp00
if [ $? -ne 0 ]
then
	echo "*** error *** create ***" $1 $2
	exit	1
fi
# -------------------------------------------------------
cd $READ
./gox > /tmp/tmp01_$KEY
if [ $? -ne 0 ]
then
	echo "*** error *** read ***" $1 $2
	exit	1
fi
# -------------------------------------------------------
cd $HOME_PT/update
./go_up > /tmp/tmp00_$KEY
cd $READ
./gox > /tmp/tmp02_$KEY
#
# -------------------------------------------------------
cd $HOME_PT/delete
./go_del > /tmp/tmp00_$KEY
cd $READ
./gox > /tmp/tmp03_$KEY
#
# -------------------------------------------------------
cd $HOME_PT/create
./gox > /tmp/tmp00_$KEY
cd $READ
./gox > /tmp/tmp04_$KEY
#
# -------------------------------------------------------
