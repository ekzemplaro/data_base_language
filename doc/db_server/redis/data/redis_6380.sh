#! /bin/bash
#
#	redis_6380.sh
#
#					Jun/29/2017
#
LOG_FILE="/tmp/redis_6380.log"
#
redis-server /opt/redis/redis_6380.conf > $LOG_FILE
#
