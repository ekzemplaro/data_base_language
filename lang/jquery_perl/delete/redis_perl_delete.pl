#! /usr/bin/perl
#
#	redis_perl_delete.pl
#
#						Mar/25/2013
# ---------------------------------------------------------------------
use	strict;
use	warnings;
#
use Redis;
#
use	CGI qw (:standard);
#
use	DBI;
use lib '/var/www/data_base/common/perl_common';
use	cgi_manipulate;
# ---------------------------------------------------------------------
#
my $rr = Redis->new ( server => 'host_dbase:6379');
#
#
print "Content-type: text/html\n\n";
#
#
my @arry_bb = cgi_manipulate::parse_parameter ();
#
print "*** redis_perl_delete.pl *** start ***<br />";
#
my $it=0;
foreach (@{$arry_bb[0]})
	{
	my $id = $arry_bb[0][$it];
	print "$id <br />";
	$rr->del($id);
	$it++;
	}
#
$rr->quit;
#
print "*** redis_perl_delete.pl *** end ***<br />";
#
# ---------------------------------------------------------------------
#
