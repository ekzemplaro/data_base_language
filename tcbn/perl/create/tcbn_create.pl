#! /usr/bin/perl
#
#	tcbn_create.pl
#
#					Jul/23/2011
# ----------------------------------------------------------
use	strict;
use	warnings;
#
use	TokyoCabinet;
use	utf8;
use	Encode;
#
use	lib '/var/www/data_base/common/perl_common';
use	kvalue_manipulate;
use	tcbn_manipulate;
# ----------------------------------------------------------
sub data_out_proc
{
	my $bdb =$_[0];

	tcbn_manipulate::record_out_proc ($bdb,'t0831','水戸',43275,"2005-9-23");
	tcbn_manipulate::record_out_proc ($bdb,'t0832',"古河",27568,"2005-7-24");
	tcbn_manipulate::record_out_proc ($bdb,'t0833',"結城",24687,"2005-6-27");
	tcbn_manipulate::record_out_proc ($bdb,'t0834',"土浦",96254,"2005-9-12");
	tcbn_manipulate::record_out_proc ($bdb,'t0835',"牛久",81923,"2005-1-11");
	tcbn_manipulate::record_out_proc ($bdb,'t0836',"取手",71815,"2005-2-25");
	tcbn_manipulate::record_out_proc ($bdb,'t0837',"つくば",34172,"2005-7-9");
	tcbn_manipulate::record_out_proc ($bdb,'t0838',"日立",41753,"2005-10-12");
	tcbn_manipulate::record_out_proc ($bdb,'t0839',"守谷",92127,"2005-11-21");

}

# ----------------------------------------------------------
print (encode ('utf-8',"*** 開始 ***\n"));

my $file_in = $ARGV[0];

unlink $file_in;

my $bdb = TokyoCabinet::BDB->new();

if(!$bdb->open($file_in, $bdb->OWRITER | $bdb->OCREAT))
{
	my $ecode = $bdb->ecode();
	printf STDERR ("open error: %s\n", $bdb->errmsg($ecode));
}


data_out_proc ($bdb);

# traverse records
my $cur = TokyoCabinet::BDBCUR->new($bdb);
$cur->first();
while(defined(my $key = $cur->key()))
	{
	my $json_str = $cur->val();
	if(defined($json_str))
		{
		kvalue_manipulate::json_display_proc ($key,$json_str);
		}
	$cur->next();
	}

# close the database
if(!$bdb->close()){
	my $ecode = $bdb->ecode();
	printf STDERR ("close error: %s\n", $bdb->errmsg($ecode));
}

chmod (0666,$file_in);

print (encode ('utf-8',"*** 終了 ***\n"));
# ----------------------------------------------------------
