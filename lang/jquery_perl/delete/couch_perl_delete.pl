#! /usr/bin/perl
#
#	couch_perl_delete.pl
#
#						Jul/23/2014
# ---------------------------------------------------------------------
use	strict;
use	warnings;
#
use	Encode;
use	JSON;
use	CGI qw (:standard);
#
use lib '/var/www/data_base/common/perl_common';
use cgi_manipulate;
use uri_get;
#
# ---------------------------------------------------------------------
my $url = 'http://localhost:5984/nagano';
#
print "Content-type: text/html\n\n";
#
my @arry_bb = cgi_manipulate::parse_parameter ();
#
print "*** couch_perl_delete.pl *** start ***<br />";
#
my $it=0;
foreach (@{$arry_bb[0]})
	{
	my $id = $arry_bb[0][$it];
	print "$id<br />";
	my $url_target = $url . "/" . $id;
#
	my $str_json = uri_get::uri_get_proc ($url_target);
#
	my $data = decode_json ($str_json);
	my $rev = $data->{_rev};
#
	my $url_del = $url_target . '?rev=' . $rev;
	uri_get::uri_delete_proc ($url_del);
#
	$it++;
	}
#
print "*** couch_perl_delete.pl *** end ***<br />";
#
# ---------------------------------------------------------------------
#
