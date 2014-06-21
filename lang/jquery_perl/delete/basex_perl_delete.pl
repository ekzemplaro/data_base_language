#! /usr/bin/perl
#
#	basex_perl_delete.pl
#
#						Jul/27/2012
# ---------------------------------------------------------------------
use	strict;
use	warnings;
#
use	Encode;
use	JSON;
use	CGI qw (:standard);
#
use XML::DOM;
#
use lib '/var/www/data_base/common/perl_common';
use cgi_manipulate;
use xml_manipulate;
use text_manipulate;
use uri_get;
#
# ---------------------------------------------------------------------
my $uri_base = 'http://admin:admin@localhost:8984/rest/cities';
#
my $uri_aa = $uri_base . '?query=/';
#
my $str_xml = uri_get::uri_get_proc ($uri_aa);
#
my %dict_aa = xml_manipulate::xml_to_dict_proc ($str_xml);
#
print "Content-type: text/html\n\n";
#
my @arry_bb = cgi_manipulate::parse_parameter ();
#
my $it=0;
foreach (@{$arry_bb[0]})
	{
	my $id = $arry_bb[0][$it];
	print "$id <br />";
	%dict_aa = text_manipulate::dict_delete_proc ($id,%dict_aa);
	$it++;
	}
#
my $xml_str = xml_manipulate::dict_to_xml_proc (%dict_aa);
#
uri_get::uri_put_proc ($uri_base,encode ('utf8',$xml_str));
#
#
print "*** basex_perl_delete.pl *** end ***<br />";
#
# ---------------------------------------------------------------------
#
