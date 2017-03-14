#! /bin/bash
#
#	redis_create.sh
#
#						Mar/15/2015
#
# --------------------------------------------------------------------------
echo "*** 開始 ***"
#
hostname="localhost"
#
redis-cli -h $hostname -p 6379 set t1851 '{"name":"福井","population":24815,"date_mod":"2001-7-14"}'
redis-cli -h $hostname -p 6379 set t1852 '{"name":"敦賀","population":46729,"date_mod":"2001-9-17"}'
redis-cli -h $hostname -p 6379 set t1853 '{"name":"小浜","population":15643,"date_mod":"2001-8-9"}'
redis-cli -h $hostname -p 6379 set t1854 '{"name":"大野","population":26957,"date_mod":"2001-10-12"}'
redis-cli -h $hostname -p 6379 set t1855 '{"name":"勝山","population":69581,"date_mod":"2001-11-15"}'
redis-cli -h $hostname -p 6379 set t1856 '{"name":"鯖江","population":32914,"date_mod":"2001-5-12"}'
redis-cli -h $hostname -p 6379 set t1857 '{"name":"あわら","population":52763,"date_mod":"2001-2-14"}'
redis-cli -h $hostname -p 6379 set t1858 '{"name":"越前","population":71954,"date_mod":"2001-1-19"}'
redis-cli -h $hostname -p 6379 set t1859 '{"name":"坂井","population":41852,"date_mod":"2001-7-11"}'
# --------------------------------------------------------------------------
#
echo "*** 終了 ***"
# --------------------------------------------------------------------------
