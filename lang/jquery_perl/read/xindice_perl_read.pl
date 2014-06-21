#! /usr/bin/perl
#
#	jquery_perl/read/xindice_perl_read.pl
#
#				Jun/02/2011
#
# ----------------------------------------------------------------
use	strict;
use	warnings;
use CGI;
use JSON;
use Encode;
use XML::DOM;
#
use lib '/var/www/data_base/common/perl_common';
use xml_manipulate;
use uri_get;
#
my $uri = 'http://cdbd026:8888/xindice/db/cities/cities';
my $str_xml = uri_get::uri_get_proc ($uri);
#
my %dict_aa = xml_manipulate::xml_to_dict_proc ($str_xml);
#
my $out_str = encode_json (\%dict_aa);
#
print "Content-Type: text/json\n\n";
#
print decode ('utf-8',$out_str), "\n";
#
# ----------------------------------------------------------------
