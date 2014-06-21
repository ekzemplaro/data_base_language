#! /usr/bin/perl

use strict;
use Cache::Memcached;

my $memcached = Cache::Memcached->new({
    servers => ["127.0.0.1:21201"]
});

print "*** start ***\n";

for (my $it=1521; $it < 1533; $it++)
	{
	print $it . "\t" . $memcached->get($it) . "\n";
	}

print "\n*** end ***\n";
