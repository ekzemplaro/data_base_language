#! /usr/bin/perl
#
#	xml_delete.pl
#
#				May/20/2011
#
# ----------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
#
use Encode;
use XML::Simple;
use lib '/var/www/data_base/common/perl_common';
use xml_manipulate;
use text_manipulate;
use file_io;
#
print (encode ('utf-8',"*** 開始 ***\n"));
#
my $file_xml = $ARGV[0];
my $id_in = $ARGV[1];
print	$id_in . "\n";
#
my $str_xml = file_io::string_read_proc ($file_xml);
#
my %dict_aa = xml_manipulate::xml_to_dict_proc ($str_xml);
#
#
%dict_aa = text_manipulate::dict_delete_proc ($id_in,%dict_aa);
print "*** check rrr ***\n";
#
#
my $xml_str = xml_manipulate::dict_to_xml_proc (%dict_aa);
#
file_io::string_write_proc ($file_xml,encode ('utf-8',$xml_str));
#
print (encode ('utf-8',"*** 終了 ***\n"));
# ----------------------------------------------------------------
