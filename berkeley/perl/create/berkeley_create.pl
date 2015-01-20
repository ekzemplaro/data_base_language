#! /usr/bin/perl
#
#	berkeley_create.pl
#
#					Jan/06/2015
#
# ------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
use	Encode;
use	JSON;
#
use	DB_File;
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
# ------------------------------------------------------------
print (encode ('utf-8',"*** 開始 ***\n"));
#
my $db_file = $ARGV[0];
unlink ($db_file);
dbmopen (my %dd,$db_file,0644);
#
my %dict_aa = data_prepare_proc ();
#
text_manipulate::dict_display_proc (%dict_aa);
#
foreach my $key (sort keys %dict_aa)
	{
	my $str_json = encode_json ($dict_aa{$key});
	$dd{$key}=$str_json;
	}
#
dbmclose (%dd);
#
print (encode ('utf-8',"*** 終了 ***\n"));
#
# ------------------------------------------------------------
sub data_prepare_proc
{
	my %dict_aa;
	%dict_aa = text_manipulate::dict_append_proc
		('t2451','津',74216,'2005-6-18',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2452','鈴鹿',14278,'2005-3-15',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2453','伊勢',52941,'2005-6-17',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2454','鳥羽',71932,'2005-8-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2455','四日市',54129,'2005-2-28',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2456','亀山',91683,'2005-5-9',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2457','尾鷲',39157,'2005-4-10',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2458','桑名',81576,'2005-10-8',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2459','志摩',64823,'2005-5-21',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2460','伊賀',27945,'2005-8-12',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2461','名張',45863,'2005-9-28',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2462','熊野',39254,'2005-10-9',%dict_aa);

	return	%dict_aa;
}
# ------------------------------------------------------------
