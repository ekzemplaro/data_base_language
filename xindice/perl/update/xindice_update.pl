#! /usr/bin/perl
#
#	xindice_update.pl
#
#					May/20/2011
# ----------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;

use	Encode;
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
my $uri = 'http://cdbd026:8888/xindice/db/cities/cities';
#
#
my $str_xml = uri_get::uri_get_proc ($uri);
#
print "*** pppp ***\n";
#my %dict_aa = xml_manipulate::xml_to_dict_proc (decode ('utf8',$str_xml));
my %dict_aa = xml_manipulate::xml_to_dict_proc ($str_xml);
print "*** qqqq ***\n";
#
%dict_aa = text_manipulate::dict_update_proc ($id_in,$population_in,%dict_aa);
print "*** rrrr ***\n";
#
my $xml_str = xml_manipulate::dict_to_xml_proc (%dict_aa);
#
uri_get::uri_put_proc ($uri,encode ('utf8',$xml_str));
#
print (encode ('utf-8',"*** 終了 ***\n"));
#
# ----------------------------------------------------------------
