#
HOST=`hostname`
DATE=`date "+%Y%m%d-%H%M%S"`
URL=http://nlf132/data_base/examples/api/count_up/count_up.py
#
curl $URL -X POST -d 'host='$HOST -d 'date='$DATE -d 'key=A0123'
#
