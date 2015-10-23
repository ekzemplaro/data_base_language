#
HOST=`hostname`
DATE=`date "+%Y%m%d-%H%M%S"`
URL=http://nlf132/data_base/examples/api/count_up/count_up.py
curl $URL'?host='$HOST'&date='$DATE'&key=A0123'
#
