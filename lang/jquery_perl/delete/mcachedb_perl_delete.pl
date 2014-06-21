#! /usr/bin/perl
#
#	mcachedb_perl_delete.pl
#
#						Oct/21/2010
# ---------------------------------------------------------------------
#
use	strict;
use	warnings;
#
use Cache::Memcached;
#
use	CGI qw (:standard);
#
use	DBI;
use lib '/var/www/data_base/common/perl_common';
use	cgi_manipulate;
#
my $memcached = Cache::Memcached->new({
    servers => ["127.0.0.1:21201"]});
#
#
print "Content-type: text/html\n\n";
#
#
my @arry_bb = cgi_manipulate::parse_parameter ();
#
print "*** mcachedb_perl_delete.pl *** start ***<br />";
#
my $it=0;
foreach (@{$arry_bb[0]})
	{
	my $id = $arry_bb[0][$it];
	print "$id <br />";
	$memcached->delete ($id);
	$it++;
	}
#
print "*** mcachedb_perl_delete.pl *** end ***<br />";
#
# ---------------------------------------------------------------------
#
