#! /usr/bin/perl
#
#	json_read.pl
#
#					Jun/22/2020
#
#
# ----------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
use	JSON;
use	Encode;
use	Data::Dumper;
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
use file_io;
#
# ----------------------------------------------------------------
print STDERR encode_utf8 ("*** 開始 ***\n");
my $file_in= $ARGV[0];
#
my $str_json = file_io::string_read_proc ($file_in);
#
my %dict_aa = %{decode_json ($str_json)};
#
print (encode ('utf-8',"*** pppp ***\n"));
#
text_manipulate::dict_display_proc (%dict_aa);
#
print STDERR encode_utf8 ("*** 終了 ***\n");
#
# ----------------------------------------------------------------
