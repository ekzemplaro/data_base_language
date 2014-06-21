#! /usr/bin/perl
#
#	tcbn_update.pl
#
#					Sep/21/2010
# ----------------------------------------------------------
use	TokyoCabinet;
use	strict;
use	warnings;
use	Encode;
use	JSON;
use	utf8;
#
use	lib '/var/www/data_base/common/perl_common';
use	kvalue_manipulate;
use	text_manipulate;
use	tcbn_manipulate;
# ----------------------------------------------------------
print (encode ('utf-8',"*** 開始 ***\n"));

my $file_in = $ARGV[0];
my $id_in = $ARGV[1];
my $population_in = $ARGV[2];

print ("$id_in\t$population_in\n");
my $bdb = TokyoCabinet::BDB->new();

if(!$bdb->open($file_in, $bdb->OWRITER | $bdb->OCREAT))
{
	my $ecode = $bdb->ecode();
	printf STDERR ("open error: %s\n", $bdb->errmsg($ecode));
}


tcbn_manipulate::data_update_proc ($bdb,$id_in,$population_in);

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

print (encode ('utf-8',"*** 終了 ***\n"));

# ----------------------------------------------------------
