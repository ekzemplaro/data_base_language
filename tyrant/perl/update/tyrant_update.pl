#! /usr/bin/perl
#
#	tyrant_update.pl
#
#						Jun/21/2011
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
    servers => ["127.0.0.1:1978"]});
#
mcache_manipulate::mcache_update_proc ($memcached,$id_in,$population_in);

my @keys = ('t4761','t4762','t4763',
	't4764','t4765','t4766',
	't4767','t4768','t4769');
foreach (@keys)
	{
	my $ikey = $_;
	mcache_manipulate::mcache_display_proc ($memcached,$ikey);
	}
#
print "*** 終了***\n";
