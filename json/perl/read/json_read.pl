#! /usr/bin/perl
#
#	json_read.pl
#
#					Jul/02/2020
#
#
# ----------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
use	JSON;
use	Data::Dumper;
binmode STDOUT, ":encoding(UTF-8)";
binmode STDERR, ":encoding(UTF-8)";
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
use file_io;
#
# ----------------------------------------------------------------
print STDERR "*** 開始 ***\n";
my $file_in= $ARGV[0];
#
my $str_json = file_io::string_read_proc ($file_in);
#
my %dict_aa = %{decode_json ($str_json)};
#
text_manipulate::dict_display_proc (%dict_aa);
#
print STDERR "*** 終了 ***\n";
#
# ----------------------------------------------------------------
