#! /usr/bin/perl
#
#	json_create.pl
#
#					Sep/14/2011
#
#
# ----------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
#
use JSON;
use Encode;
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
use file_io;
#
# ----------------------------------------------------------------
print (encode ('utf-8',"*** 開始 ***\n"));
#

my $file_json = $ARGV[0];
#

my %dict_aa = data_prepare_proc ();
#my %dict_aa = %{$dict_data};

text_manipulate::dict_display_proc (%dict_aa);
my $str_json = encode_json (\%dict_aa);

#print ($str_json);
#
file_io::string_write_proc ($file_json,$str_json);
#
print (encode ('utf-8',"*** 終了 ***\n"));
#
# ----------------------------------------------------------------
sub data_prepare_proc
{
	my %dict_aa = text_manipulate::dict_append_proc
		('t0921','宇都宮',71842,'2005-9-12',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0922','小山',14278,'2005-3-15',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0923','佐野',58641,'2005-6-17',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0924','足利',46432,'2005-8-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0925','日光',27149,'2005-2-28',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0926','下野',92136,'2005-5-9',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0927','さくら',35187,'2005-4-10',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0928','矢板',85126,'2005-10-8',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0929','真岡',64857,'2005-5-21',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0930','栃木',52937,'2005-8-14',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0931','大田原',23789,'2005-7-17',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0932','鹿沼',72345,'2005-5-16',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0933','那須塩原',23257,'2005-4-12',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t0934','那須烏山',37871,'2005-3-21',%dict_aa);

	return	%dict_aa;
}

# ----------------------------------------------------------------
