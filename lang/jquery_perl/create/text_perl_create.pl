#! /usr/bin/perl
#
#	jquery_perl/create/text_perl_create.pl
#
#
#						Jul/09/2011
#
# ----------------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
#
use	JSON;
use	Encode;
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
#
# ----------------------------------------------------------------------
my $file_text = "/var/tmp/plain_text/cities.txt";

my %dict_aa = data_prepare_proc ();
#
text_manipulate::text_write_proc ($file_text,%dict_aa);
#
print "Content-type: text/html\n\n";
#
#
print "*** OK ***\n";
# ----------------------------------------------------------------------
sub data_prepare_proc
{
	my %dict_aa;
	%dict_aa = text_manipulate::dict_append_proc
		('t2381','名古屋',75800,'2005-9-12',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2382','豊橋',16200,'2005-3-15',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2383','岡崎',58600,'2005-6-17',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2384','一宮',47300,'2005-8-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2385','蒲郡',27100,'2005-2-28',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2386','常滑',92600,'2005-5-9',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2387','大府',35700,'2005-4-10',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2388','瀬戸',85300,'2005-10-8',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2389','犬山',64800,'2005-5-21',%dict_aa);

	return	%dict_aa;
}

# ----------------------------------------------------------------------
