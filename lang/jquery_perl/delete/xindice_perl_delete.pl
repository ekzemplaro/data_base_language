#! /usr/bin/perl
#
#	xindice_perl_delete.pl
#
#						Jul/23/2011
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
use xml_manipulate;
use text_manipulate;
use uri_get;
#
# ---------------------------------------------------------------------
my $uri = 'http://cdbd026:8888/xindice/db/cities/cities';
#
my $str_xml = uri_get::uri_get_proc ($uri);
#
my %dict_aa = xml_manipulate::xml_to_dict_proc ($str_xml);
#
print "Content-type: text/html\n\n";
#
my @arry_bb = cgi_manipulate::parse_parameter ();
#
print "*** xindice_perl_delete.pl *** start ***<br />";

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
uri_get::uri_put_proc ($uri,encode ('utf8',$xml_str));
#
#
print "*** xindice_perl_delete.pl *** end ***<br />";
#
# ---------------------------------------------------------------------
#
