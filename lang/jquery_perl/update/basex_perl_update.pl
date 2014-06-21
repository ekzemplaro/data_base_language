#! /usr/bin/perl
#
#	basex_perl_update.pl
#
#						Jul/27/2011
# ---------------------------------------------------------------------
use	strict;
use	warnings;
#
use	Encode;
use	JSON;
use	CGI qw (:standard);
#
use	XML::DOM;
#
use lib '/var/www/data_base/common/perl_common';
use cgi_manipulate;
use text_manipulate;
use xml_manipulate;
use uri_get;
#
# ---------------------------------------------------------------------
my $uri_base = 'http://admin:admin@localhost:8984/rest/cities';
#
my $uri_aa = $uri_base . '?query=/';
#
#
print "Content-type: text/html\n\n";
#
print "*** check aaa ***\n\n";
#
my $str_xml = uri_get::uri_get_proc ($uri_aa);
#
print "*** check bbb ***\n\n";
print $str_xml;
print "*** check ccc ***\n\n";

my %dict_aa = xml_manipulate::xml_to_dict_proc ($str_xml);
#
print "*** check ddd ***\n\n";
#
my @arry_bb = cgi_manipulate::parse_parameter ();
#
print "*** check eee ***\n\n";
my $it=0;
foreach (@{$arry_bb[0]})
	{
	my $id = $arry_bb[0][$it]->{id};
	my $population = $arry_bb[0][$it]->{population};
	print "$id $population<br />";
	%dict_aa = text_manipulate::dict_update_proc ($id,$population,%dict_aa);
	$it++;
	}
#
my $xml_str = xml_manipulate::dict_to_xml_proc (%dict_aa);
#
uri_get::uri_put_proc ($uri_base,encode ('utf8',$xml_str));
#
print "*** basex_perl_update.pl *** end ***<br />";
#
# ---------------------------------------------------------------------
#
