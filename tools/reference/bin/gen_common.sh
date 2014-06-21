#
LANG=$1
SUFFIX=$2
FILE_OUT=$3
#
FOLDER="/var/www/data_base/common/"$LANG"_common"
FILES=$FOLDER"/*."$SUFFIX
echo $FOLDER
#echo $FILES
ls $FILES | awk 'BEGIN{FS="/"}{print $NF}' > $FILE_OUT
#
