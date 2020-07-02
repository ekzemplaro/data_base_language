#! /usr/bin/perl
#
#	plain_text/perl/read/text_read.pl
#
#					Jun/02/2020
#
# ----------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
binmode STDOUT, ":encoding(UTF-8)";
binmode STDERR, ":encoding(UTF-8)";
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
# ----------------------------------------------------------------
#
my $file_in = $ARGV[0];
#
print STDERR "*** 開始 ***\n";
#
my %dict_aa = text_manipulate::text_read_proc ($file_in);

text_manipulate::dict_display_proc (%dict_aa);


print STDERR "*** 終了 ***\n";
#
# ----------------------------------------------------------------
