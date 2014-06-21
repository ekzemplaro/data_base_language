#! /usr/bin/perl
#
#	postgre_create.pl
#
#					Dec/13/2013
#
#
# ----------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
#
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
my $constr = 'DBI:Pg:dbname=city host=localhost';
my $user = 'scott';
my $passwd = 'tiger';
my $dbi = DBI->connect($constr, $user, $passwd);
#
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
		('t3461','広島',75342,'2005-9-12',%dict_aa);
#		('t3461,(encode ('utf-8','広島',75842,'2005-5-12',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3462','福山',14978,'2005-3-15',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3463','東広島',58641,'2005-6-17',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3464','呉',46732,'2005-8-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3465','尾道',27159,'2005-2-28',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3466','竹原',92581,'2005-5-9',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3467','三次',35197,'2005-4-10',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3468','大竹',85126,'2005-10-8',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3469','府中',64817,'2005-5-21',%dict_aa);

	return	%dict_aa;
}

# ----------------------------------------------------------------
