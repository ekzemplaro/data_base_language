#! /usr/bin/perl
#
#	tyrant_update.pl
#
#						Sep/14/2015
#
# ----------------------------------------------------------------
use strict;
use warnings;
use Cache::Memcached;
use JSON;
#
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
use mcache_manipulate;
#
# ----------------------------------------------------------------
#
print "*** 開始 ***\n";
#
my $id_in = $ARGV[0];
my $population_in = $ARGV[1];
print ("$id_in\t$population_in\n");
#
my $memcached = Cache::Memcached->new({
    servers => ["host_ubuntu:1978"]});
#
mcache_manipulate::mcache_update_proc ($memcached,$id_in,$population_in);
#
print "*** 終了***\n";
