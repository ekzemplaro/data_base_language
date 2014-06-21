#! /usr/bin/perl
#
#	jquery_perl/read/basex_perl_read.pl
#
#				May/31/2012
#
# ----------------------------------------------------------------
use	strict;
use	warnings;
#
use CGI;
use JSON;
use Encode;
use XML::DOM;
#
use lib '/var/www/data_base/common/perl_common';
use xml_manipulate;
use uri_get;
#
my $uri = 'http://admin:admin@localhost:8984/rest/cities?query=/';
#
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
