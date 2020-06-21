#! /usr/bin/perl
#
#	maria_create.pl
#
#					Jun/21/2020
#
#
# ----------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
use	Encode;
use	DBI;
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
use sql_manipulate;
#
# ----------------------------------------------------------------
print STDERR (encode ('utf-8',"*** 開始 ***\n"));
#
#
my %dict_aa = data_prepare_proc ();
#
text_manipulate::dict_display_proc (%dict_aa);
#
my $constr = 'DBI:mysql:city:localhost';

my $user = 'scott';
my $passwd = 'tiger123';

my $dbi = DBI->connect($constr, $user, $passwd);
#
sql_manipulate::mysql_utf8_proc ($dbi);
sql_manipulate::drop_table_proc ($dbi);
sql_manipulate::create_table_proc ($dbi);
#
sql_manipulate::table_insert_proc ($dbi,%dict_aa);
#
$dbi->disconnect;
#
print STDERR (encode ('utf-8',"*** 終了 ***\n"));
#
# ----------------------------------------------------------------
sub data_prepare_proc
{
	my %dict_aa;
	%dict_aa = text_manipulate::dict_append_proc
		('t3321','岡山',315842,'2005-6-24',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3322','倉敷',964278,'2005-8-8',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3323','津山',758641,'2005-9-17',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3324','玉野',516432,'2005-7-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3325','笠岡',327159,'2005-2-28',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3326','井原',792581,'2005-5-9',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3327','総社',635197,'2005-4-10',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3328','高梁',485136,'2005-10-8',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3329','新見',164827,'2005-5-21',%dict_aa);

	return	%dict_aa;
}
# ----------------------------------------------------------------
