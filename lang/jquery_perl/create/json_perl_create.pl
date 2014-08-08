#! /usr/bin/perl
#
#	jquery_perl/create/json_perl_create.pl
#
#
#						Aug/04/2014
#
# ----------------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
#
use	Encode;
use	JSON;
#
use lib '/var/www/data_base/common/perl_common';
use file_io;
use text_manipulate;
#
# ----------------------------------------------------------------------
my $file_json = "/var/tmp/json/cities.json";

my %dict_aa = data_prepare_proc ();
my $json_str = encode_json (\%dict_aa);
#
file_io::string_write_proc ($file_json,$json_str);
#
print "Content-type: text/html\n\n";
#
#
print "*** OK ***\n";
# ----------------------------------------------------------------------
sub data_prepare_proc
{
	my %dict_aa = text_manipulate::dict_append_proc
		('t0921','宇都宮',45800,'2005-9-12',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0922','小山',14200,'2005-3-15',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0923','佐野',58600,'2005-6-17',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0924','足利',46700,'2005-8-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0925','日光',27800,'2005-2-28',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0926','下野',92100,'2005-5-9',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0927','さくら',35700,'2005-4-10',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0928','矢板',85100,'2005-10-8',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0929','真岡',64800,'2005-5-21',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0930','栃木',52700,'2005-8-14',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0931','大田原',23900,'2005-7-17',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0932','鹿沼',71300,'2005-5-16',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0933','那須塩原',25700,'2005-4-12',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0934','那須烏山',32800,'2005-3-21',%dict_aa);

	return	%dict_aa;
}

# ----------------------------------------------------------------------
