#! /usr/bin/perl
#
#	jquery_perl/read/dbxml_perl_read.pl
#
#				Jun/23/2010
#
# ----------------------------------------------------------------
use	strict;
use	warnings;
use CGI;
use JSON;
use Encode;
use XML::DOM;
#
use lib '/var/www/uchida/data_base/common/perl_common';
use xml_manipulate;
use uri_get;
#
# ----------------------------------------------------------------
my $uri = 'http://scott:tiger@cpt003:7280/rest/cities/cities.xml';
#
my $xml_str = uri_get::uri_get_proc ($uri);
#
#
print "Content-Type: text/json\n\n";
#
#
my $parser = new XML::DOM::Parser;
my $doc = $parser->parse($xml_str);
my $data = xml_manipulate::doc_to_array_proc ($doc);
my $out_str = encode_json ($data);
print decode ('utf-8',$out_str), "\n";
#
# ----------------------------------------------------------------
