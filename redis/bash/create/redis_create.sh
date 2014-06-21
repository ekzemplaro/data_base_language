#! /bin/bash
#
#	redis_create.sh
#
#						Feb/16/2012
#
# --------------------------------------------------------------------------
echo "*** 開始 ***"
#
redis-cli -h host_dbase -p 6379 set t1851 '{"name":"福井","population":23815,"date_mod":"2001-7-14"}'
redis-cli -h host_dbase -p 6379 set t1852 '{"name":"敦賀","population":46749,"date_mod":"2001-9-17"}'
redis-cli -h host_dbase -p 6379 set t1853 '{"name":"小浜","population":15613,"date_mod":"2001-8-9"}'
redis-cli -h host_dbase -p 6379 set t1854 '{"name":"大野","population":26927,"date_mod":"2001-10-12"}'
redis-cli -h host_dbase -p 6379 set t1855 '{"name":"勝山","population":69581,"date_mod":"2001-11-15"}'
redis-cli -h host_dbase -p 6379 set t1856 '{"name":"鯖江","population":42914,"date_mod":"2001-5-12"}'
redis-cli -h host_dbase -p 6379 set t1857 '{"name":"あわら","population":52763,"date_mod":"2001-2-14"}'
redis-cli -h host_dbase -p 6379 set t1858 '{"name":"越前","population":72654,"date_mod":"2001-1-19"}'
redis-cli -h host_dbase -p 6379 set t1859 '{"name":"坂井","population":41752,"date_mod":"2001-7-11"}'
# --------------------------------------------------------------------------
redis-cli -h host_dbase -p 6379 get t1851
redis-cli -h host_dbase -p 6379 get t1852
redis-cli -h host_dbase -p 6379 get t1853
redis-cli -h host_dbase -p 6379 get t1854
redis-cli -h host_dbase -p 6379 get t1855
redis-cli -h host_dbase -p 6379 get t1856
redis-cli -h host_dbase -p 6379 get t1857
redis-cli -h host_dbase -p 6379 get t1858
redis-cli -h host_dbase -p 6379 get t1859
#
echo "*** 終了 ***"
# --------------------------------------------------------------------------
