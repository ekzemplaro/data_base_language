#! /bin/bash
#
#	redis_bash_create.sh
#
#					Jun/14/2013
#
#
#
#
# --------------------------------------------------------------------------
#
echo "Content-type: text/html"
echo ""
echo ""
#
redis-cli -h host_dbase -p 6379 set t1851 '{"name":"福井","population":25300,"date_mod":"2001-7-14"}'
redis-cli -h host_dbase -p 6379 set t1852 '{"name":"敦賀","population":41600,"date_mod":"2001-9-17"}'
redis-cli -h host_dbase -p 6379 set t1853 '{"name":"小浜","population":17500,"date_mod":"2001-8-9"}'
redis-cli -h host_dbase -p 6379 set t1854 '{"name":"大野","population":82400,"date_mod":"2001-10-12"}'
redis-cli -h host_dbase -p 6379 set t1855 '{"name":"勝山","population":94600,"date_mod":"2001-11-15"}'
redis-cli -h host_dbase -p 6379 set t1856 '{"name":"鯖江","population":47900,"date_mod":"2001-5-12"}'
redis-cli -h host_dbase -p 6379 set t1857 '{"name":"あわら","population":35200,"date_mod":"2001-2-14"}'
redis-cli -h host_dbase -p 6379 set t1858 '{"name":"越前","population":73800,"date_mod":"2001-1-19"}'
redis-cli -h host_dbase -p 6379 set t1859 '{"name":"坂井","population":62100,"date_mod":"2001-7-15"}'
#
#
echo "*** OK ***"
#
# --------------------------------------------------------------------------
