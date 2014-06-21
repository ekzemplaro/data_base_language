#! /usr/bin/perl
#
#	riak_perl_delete.pl
#
#						Apr/12/2013
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
use text_manipulate;
use uri_get;
#
# ---------------------------------------------------------------------
my $url_base = 'http://localhost:8098/riak/shimane';
#
#
print "Content-type: text/html\n\n";
#
my @arry_bb = cgi_manipulate::parse_parameter ();
#
print "*** riak_perl_delete.pl *** start ***<br />";
#
my $it=0;
foreach (@{$arry_bb[0]})
	{
	my $id = $arry_bb[0][$it];
	print "$id<br />";
	my $url_target = $url_base . '/' . $id;
	uri_get::uri_delete_proc ($url_target);
	$it++;
	}
#
#
#
print "*** riak_perl_delete.pl *** end ***<br />";
#
# ---------------------------------------------------------------------
#
