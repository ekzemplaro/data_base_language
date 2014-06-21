#! /usr/bin/perl
#
#	update/mcachedb_update.pl
#
#					Jun/17/2011
#
# ----------------------------------------------------------------
use	strict;
use	warnings;
use	Cache::Memcached;
use	JSON;
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
my $id_in = $ARGV[0];
my $population_in = $ARGV[1];
print ("$id_in\t$population_in\n");
#
#
my $memcached = Cache::Memcached->new({
    servers => ["127.0.0.1:21201"]});
#
mcache_manipulate::mcache_update_proc ($memcached,$id_in,$population_in);

print "*** pppp ***\n";

my @keys = ('t1521','t1522','t1523',
	't1524','t1525','t1526',
	't1527','t1528','t1529',
	't1530','t1531','t1532');
#
foreach (@keys)
	{
	my $ikey = $_;
	mcache_manipulate::mcache_display_proc ($memcached,$ikey);
	}
#
print "*** 終了 ***\n";
# ----------------------------------------------------------------
