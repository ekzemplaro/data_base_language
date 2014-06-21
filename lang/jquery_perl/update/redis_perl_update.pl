#! /usr/bin/perl
#
#	redis_perl_update.pl
#
#						Mar/25/2013
# ---------------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
#
use Redis;
use JSON;
#
use	CGI qw (:standard);
#
use lib '/var/www/data_base/common/perl_common';
use	cgi_manipulate;
use	text_manipulate;
use	redis_manipulate;
use	kvalue_manipulate;
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
print "*** redis_perl_update.pl *** start ***<br />";
#
my $it=0;
foreach (@{$arry_bb[0]})
	{
	my $id = $arry_bb[0][$it]->{id};
	my $population = $arry_bb[0][$it]->{population};
	print "$id $population<br />";
	redis_manipulate::redis_update_proc ($rr,$id,$population);
	$it++;
	}
#
$rr->quit;
#
print "*** redis_perl_update.pl *** end ***<br />";
#
# ---------------------------------------------------------------------
#
