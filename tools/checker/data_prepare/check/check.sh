#! /bin/bash
#
DBASE=$1
LANG=$2
HOME_PT="/var/www/data_base/"$1"/"$2
READ=$HOME_PT/read
#
rm -f /tmp/tmp*
#
# -------------------------------------------------------
cd $HOME_PT/create
if [ -e Makefile ]
then
	make
fi
./gox > /tmp/tmp00
if [ $? -ne 0 ]
then
	echo "*** error *** create ***" $1 $2
	exit	1
fi
# -------------------------------------------------------
cd $READ
if [ -e Makefile ]
then
	make
fi
./gox > /tmp/tmp01
if [ $? -ne 0 ]
then
	echo "*** error *** read ***" $1 $2
	exit	1
fi
# -------------------------------------------------------
cd $HOME_PT/update
if [ -e Makefile ]
then
	make
fi
./go_up > /tmp/tmp00
cd $READ
./gox > /tmp/tmp02
#
# -------------------------------------------------------
cd $HOME_PT/delete
if [ -e Makefile ]
then
	make
fi
./go_del > /tmp/tmp00
cd $READ
./gox > /tmp/tmp03
#
# -------------------------------------------------------
cd $HOME_PT/create
./gox > /tmp/tmp00
cd $READ
./gox > /tmp/tmp04
#
# -------------------------------------------------------
