#! /usr/bin/perl
#
#	mcached_delete.pl
#
#					Sep/14/2015
#
# ----------------------------------------------------------------
use strict;
use warnings;
use Cache::Memcached;
#
# ----------------------------------------------------------------
#
print "*** 開始 ***\n";
#
my $id_in = $ARGV[0];
print ("$id_in\n");
#
my $memcached = Cache::Memcached->new({
    servers => ["127.0.0.1:11211"]});
#
$memcached->delete ($id_in);
#
print "*** 終了***\n";
# ----------------------------------------------------------------
