#! /usr/bin/perl
#
#	mysql_create.pl
#
#					May/30/2011
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
print	(encode ('utf-8',"*** 開始 ***\n"));
#
#
my %dict_aa = data_prepare_proc ();
#
text_manipulate::dict_display_proc (%dict_aa);
#
my $constr = 'DBI:mysql:city:host_mysql';

my $user = 'scott';
my $passwd = 'tiger';

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
print	(encode ('utf-8',"*** 終了 ***\n"));
#
# ----------------------------------------------------------------
sub data_prepare_proc
{
	my %dict_aa;
	%dict_aa = text_manipulate::dict_append_proc
		('t3321','岡山',75842,'2005-9-12',%dict_aa);
#		('t3321,(encode ('utf-8','岡山',75842,'2005-9-12',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3322','倉敷',14278,'2005-3-15',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3323','津山',58641,'2005-6-17',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3324','玉野',46432,'2005-8-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3325','笠岡',27159,'2005-2-28',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3326','井原',92181,'2005-5-9',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3327','総社',35197,'2005-4-10',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3328','高梁',85136,'2005-10-8',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3329','新見',64827,'2005-5-21',%dict_aa);

	return	%dict_aa;
}
# ----------------------------------------------------------------
