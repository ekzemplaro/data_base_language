#! /usr/bin/perl
#
#	exist_perl_update.pl
#
#						Jun/17/2011
# ---------------------------------------------------------------------
use	strict;
use	warnings;
#
use	Encode;
use JSON;
use	CGI qw (:standard);
#
use XML::DOM;
#
use lib '/var/www/data_base/common/perl_common';
use cgi_manipulate;
use text_manipulate;
use xml_manipulate;
use uri_get;
#
# ---------------------------------------------------------------------
my $uri = 'http://localhost:8086/exist/rest/db/cities/cities.xml';
#
#
my $str_xml = uri_get::uri_get_proc ($uri);
#
my %dict_aa = xml_manipulate::xml_to_dict_proc ($str_xml);
#
print "Content-type: text/html\n\n";
#
my @arry_bb = cgi_manipulate::parse_parameter ();
#
print "*** exist_perl_update.pl *** start ***<br />";

#
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
print "*** exist_perl_update.pl *** ppp ***<br />";
my $xml_str = xml_manipulate::dict_to_xml_proc (%dict_aa);
print "*** exist_perl_update.pl *** qqq ***<br />";
#
uri_get::uri_put_proc ($uri,encode ('utf8',$xml_str));
print "*** exist_perl_update.pl *** rrr ***<br />";
#
print "*** exist_perl_update.pl *** end ***<br />";
#
# ---------------------------------------------------------------------
#
