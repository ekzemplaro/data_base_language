#! /usr/bin/perl
#
#	tcbn_perl_read.pl
#
#					Jun/16/2011
#
# ----------------------------------------------------------------
use TokyoCabinet;
use JSON;
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
use kvalue_manipulate;
# ----------------------------------------------------------------
#
my $file_in = '/var/tmp/tokyo_cabinet/cities.tcb';

my $bdb = TokyoCabinet::BDB->new();
if(!$bdb->open($file_in, $bdb->OWRITER | $bdb->OCREAT)){
	my $ecode = $bdb->ecode();
	printf STDERR ("open error: %s\n", $bdb->errmsg($ecode));
}
#
print "Content-type: text/json\n\n";
#
#
my %dict_aa;
my $cur = TokyoCabinet::BDBCUR->new($bdb);
$cur->first();
while(defined(my $key = $cur->key()))
{
	my $str_json = $cur->val();


	if ($str_json)
	{
	my $data = decode_json ($str_json);

	my $name=$data->{name};
	my $population=$data->{population};
	my $date_mod=$data->{date_mod};

	%dict_aa = text_manipulate::dict_append_proc
		($key,$name,$population,$date_mod,%dict_aa);


	$cur->next();
	}
}

#
my $out_str = encode_json (\%dict_aa);
#
#
print	$out_str;
#
# ----------------------------------------------------------------
