#! /usr/bin/perl
#
#	update/mcached_update.pl
#
#						Jun/17/2011
#
# ----------------------------------------------------------------
use strict;
use warnings;
use Cache::Memcached;
use JSON;
#
use Encode::Guess qw/ shiftjis euc-jp 7bit-jis /;
use Encode qw/ decode /;
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
use mcache_manipulate;
use kvalue_manipulate;
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
    servers => ["127.0.0.1:11211"]});
#
mcache_manipulate::mcache_update_proc ($memcached,$id_in,$population_in);

my @keys = ('t1731','t1732','t1733',
	't1734','t1735','t1736',
	't1737','t1738','t1739');
foreach (@keys)
	{
	my $ikey = $_;
	mcache_manipulate::mcache_display_proc ($memcached,$ikey);
	}
#
print "*** 終了***\n";
