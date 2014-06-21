#! /usr/bin/perl
#
#	exist_update.pl
#
#					May/20/2011
# ----------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;

use	Encode;
use LWP::UserAgent;
use XML::Simple;
#
use lib '/var/www/data_base/common/perl_common';
use xml_manipulate;
use text_manipulate;
use uri_get;
#
# ----------------------------------------------------------------
print (encode ('utf-8',"*** 開始 ***\n"));
#
#
my $id_in = $ARGV[0];
my $population_in = $ARGV[1];
print	$id_in . "\t";
print	$population_in . "\n";
#
my $uri = 'http://localhost:8086/exist/rest/db/cities/cities.xml';
#
#
my $str_xml = uri_get::uri_get_proc ($uri);
#
my %dict_aa = xml_manipulate::xml_to_dict_proc ($str_xml);
#
%dict_aa = text_manipulate::dict_update_proc ($id_in,$population_in,%dict_aa);
#
my $xml_str = xml_manipulate::dict_to_xml_proc (%dict_aa);
#
uri_get::uri_put_proc ($uri,encode ('utf8',$xml_str));
#
print (encode ('utf-8',"*** 終了 ***\n"));
#
# ----------------------------------------------------------------
