#! /usr/bin/perl
#
#	update/mcachedb_update.pl
#
#					Sep/14/2015
#
# ----------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
use	Cache::Memcached;
use	JSON;
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
use mcache_manipulate;
# use kvalue_manipulate;
#
# ----------------------------------------------------------------
#
print "*** 開始 ***\n";
my $id_in = $ARGV[0];
my $population_in = $ARGV[1];
print ("$id_in\t$population_in\n");
#
#
my $memcached = Cache::Memcached->new({
    servers => ["host_ubuntu:21201"]});
#
mcache_manipulate::mcache_update_proc ($memcached,$id_in,$population_in);
#
#
print "*** 終了 ***\n";
# ----------------------------------------------------------------
