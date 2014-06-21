#! /bin/bash
#
#
DBASE=$1
#LANG=$2
HOME_PT="/var/www/data_base/"$1"/"$2
#READ=$HOME_PT/read
#
rm -f /tmp/tmp*
#
# -------------------------------------------------------
cd /var/www/data_base/json/java/create
make
# -------------------------------------------------------
#cd $HOME_PT"/create"
#make
