#! /usr/bin/perl
#
#	tyrant_create.pl
#
#					Sep/14/2015
# ---------------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
use	Encode;
use	JSON;

use	Cache::Memcached;

use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
#
# ---------------------------------------------------------------------
print	(encode ('utf-8',"*** 開始 ***\n"));
#
my $memcached = Cache::Memcached->new({
    servers => ["host_ubuntu:1978"]
});

my %dict_aa = data_prepare_proc ();

foreach my $key (keys %dict_aa){
	my $str_json = encode_json ($dict_aa{$key});

	print ("$key ");

	print ("$str_json\n");
	$memcached->set($key,$str_json);
	}


print	(encode ('utf-8',"*** 終了 ***\n"));
# ---------------------------------------------------------------------
sub data_prepare_proc
{
	my %dict_aa;
	%dict_aa = text_manipulate::dict_append_proc
		('t4761','那覇',75142,'2005-9-12',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t4762','宜野湾',14278,'2005-3-15',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t4763','石垣',58641,'2005-6-17',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t4764','浦添',46832,'2005-8-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t4765','名護',27149,'2005-2-28',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t4766','糸満',92143,'2005-5-9',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t4767','沖縄',35187,'2005-4-10',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t4768','豊見城',85176,'2005-10-8',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t4769','うるま',64827,'2005-5-21',%dict_aa);

	return	%dict_aa;
}
# ---------------------------------------------------------------------
