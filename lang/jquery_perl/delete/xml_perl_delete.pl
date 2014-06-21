#! /usr/bin/perl
#
#	xml_perl_delete.pl
#
#						May/21/2011
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
use file_io;
# ---------------------------------------------------------------------
#
my $file_xml = "/var/tmp/xml_file/cities.xml";
#
my $str_xml = file_io::string_read_proc ($file_xml);
#
my %dict_aa = xml_manipulate::xml_to_dict_proc ($str_xml);
#
print "Content-type: text/html\n\n";
#
my @arry_bb = cgi_manipulate::parse_parameter ();
#
print "*** text_perl_delete.pl *** start ***<br />";

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
file_io::string_write_proc ($file_xml,encode ('utf-8',$xml_str));
#
print "*** xml_perl_delete.pl *** end ***<br />";
#
# ---------------------------------------------------------------------
#
