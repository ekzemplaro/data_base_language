#! /usr/bin/perl
#
#	read/csv_read.pl
#
#					Jan/24/2011
#
# ----------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
use	Encode;
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
# ----------------------------------------------------------------
#
my $file_in = $ARGV[0];
#
print	(encode ('utf-8',"*** 開始 ***\n"));
#
my %hash = text_manipulate::csv_read_proc ($file_in);

text_manipulate::dict_display_proc (%hash);


print	(encode ('utf-8',"*** 終了 ***\n"));
#
# ----------------------------------------------------------------
