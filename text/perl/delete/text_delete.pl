#! /usr/bin/perl
#
#	delete/text_delete.pl
#
#					Jul/02/2020
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
print STDERR "*** 開始 ***\n";
#
my $file_text = $ARGV[0];
my $id_in = $ARGV[1];
print	$id_in . "\n";
#
my %hash = text_manipulate::text_read_proc ($file_text);

%hash = text_manipulate::dict_delete_proc ($id_in,%hash);
#
text_manipulate::text_write_proc ($file_text,%hash);
#
print STDERR "*** 終了 ***\n";
#
# ----------------------------------------------------------------------
