#! /usr/bin/perl
#
#	basex_delete.pl
#
#					Oct/27/2011
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
print	$id_in . "\n";
#
#
my $uri_base = 'http://admin:admin@localhost:8984/rest/cities';
#
my $uri_aa = $uri_base . '?query=/';
#
#
my $str_xml = uri_get::uri_get_proc ($uri_aa);
#
print "*** pppp ***\n";
my %dict_aa = xml_manipulate::xml_to_dict_proc ($str_xml);
print "*** qqqq ***\n";
#
%dict_aa = text_manipulate::dict_delete_proc ($id_in,%dict_aa);
print "*** rrrr ***\n";
#
my $xml_str = xml_manipulate::dict_to_xml_proc (%dict_aa);
#
uri_get::uri_put_proc ($uri_base,encode ('utf8',$xml_str));
#
print (encode ('utf-8',"*** 終了 ***\n"));
#
# ----------------------------------------------------------------
