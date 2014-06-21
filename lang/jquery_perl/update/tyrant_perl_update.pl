#! /usr/bin/perl
#
#	tyrant_perl_update.pl
#
#						Jul/23/2011
# ---------------------------------------------------------------------
#
use	strict;
use	warnings;
#
use Cache::Memcached;
use JSON;
#
use	CGI qw (:standard);
#
use	DBI;
use lib '/var/www/data_base/common/perl_common';
use	cgi_manipulate;
use	text_manipulate;
use	mcache_manipulate;
use	kvalue_manipulate;
use	json_out;
#
my $memcached = Cache::Memcached->new({
    servers => ["127.0.0.1:1978"]});
#
#
print "Content-type: text/html\n\n";
#
#
my @arry_bb = cgi_manipulate::parse_parameter ();
#
print "*** tyrant_perl_update.pl *** start ***<br />";
#
my $it=0;
foreach (@{$arry_bb[0]})
	{
	my $id = $arry_bb[0][$it]->{id};
	my $population = $arry_bb[0][$it]->{population};
	print "$id $population<br />";
	mcache_manipulate::mcache_update_proc ($memcached,$id,$population);
	$it++;
	}
#
print "*** tyrant_perl_update.pl *** end ***<br />";
#
# ---------------------------------------------------------------------
#
