#! /usr/bin/perl
#
#	text_create.pl
#
#					Jun/02/2020
#
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
#
# ----------------------------------------------------------------
print STDERR "*** 開始 ***\n";
#
my $file_text= $ARGV[0];
#
my %dict_aa = data_prepare_proc ();
#
#text_manipulate::dict_display_proc (%dict_aa);
text_manipulate::text_write_proc ($file_text,%dict_aa);
#
print STDERR "*** 終了 ***\n";
#
# ----------------------------------------------------------------
sub data_prepare_proc
{
	my %dict_aa;
	%dict_aa = text_manipulate::dict_append_proc
		('t2381','名古屋',71842,'2005-9-12',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2382','豊橋',14278,'2005-3-15',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2383','岡崎',58641,'2005-6-17',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2384','一宮',46432,'2005-8-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2385','蒲郡',27349,'2005-2-28',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2386','常滑',92843,'2005-5-9',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2387','大府',34687,'2005-4-10',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2388','瀬戸',85279,'2005-10-8',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2389','犬山',61827,'2005-5-21',%dict_aa);

	return	%dict_aa;
}
# ----------------------------------------------------------------
