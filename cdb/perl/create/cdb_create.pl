#! /usr/bin/perl    
#
#	cdb_create.pl
#
#					Mar/25/2013
#
# ----------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
use	Encode;
use	CDB_File;
use	JSON;
#
use lib '/var/www/data_base/common/perl_common';
#
use text_manipulate;
# ----------------------------------------------------------------
print	(encode ('utf-8',"*** 開始 ***\n"));

my $file_cdb = $ARGV[0];

my %dict_aa = data_prepare_proc ();

unlink "$file_cdb" if -e "$file_cdb";
my $cdb = new CDB_File ("$file_cdb", "$file_cdb.$$") or die;

foreach my $key (sort keys %dict_aa){
	my $data = $dict_aa{$key};
	my $json_str = encode_json ($data);
	print ($json_str . "\n");
	$cdb->insert($key,$json_str);
	}

$cdb->finish;

chmod 0666, $file_cdb;

print	(encode ('utf-8',"*** 終了 ***\n"));
#
# ----------------------------------------------------------------
sub data_prepare_proc
{
	my %dict_aa;
	%dict_aa = text_manipulate::dict_append_proc
		('t2761','豊中',84291,'2005-3-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2762','池田',27836,'2005-8-5',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2763','高槻',54172,'2005-6-17',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2764','吹田',46832,'2005-8-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2765','茨木',27349,'2005-2-28',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2766','摂津',92843,'2005-5-9',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2767','泉大津',38792,'2005-4-10',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2768','和泉',85271,'2005-10-8',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2769','高石',82756,'2005-5-21',%dict_aa);

	return	%dict_aa;
}
# ----------------------------------------------------------------
