#! /usr/bin/perl
#
#	tcbn_perl_create.pl
#
#					Jul/23/2011
#
# ------------------------------------------------------------
use    strict;
use    warnings;
#
use	TokyoCabinet;
use	utf8;
#
use	lib '/var/www/data_base/common/perl_common';
use	kvalue_manipulate;
use	tcbn_manipulate;
# ------------------------------------------------------------
sub data_out_proc
{
	my $bdb =$_[0];

	tcbn_manipulate::record_out_proc ($bdb,'t0831','水戸',51300,"2005-3-21");
	tcbn_manipulate::record_out_proc ($bdb,'t0832',"古河",12700,"2005-2-17");
	tcbn_manipulate::record_out_proc ($bdb,'t0833',"結城",84600,"2005-1-7");
	tcbn_manipulate::record_out_proc ($bdb,'t0834',"土浦",75600,"2005-9-12");
	tcbn_manipulate::record_out_proc ($bdb,'t0835',"牛久",83900,"2005-4-21");
	tcbn_manipulate::record_out_proc ($bdb,'t0836',"取手",76800,"2005-2-25");
	tcbn_manipulate::record_out_proc ($bdb,'t0837',"つくば",34100,"2005-7-9");
	tcbn_manipulate::record_out_proc ($bdb,'t0838',"日立",41700,"2005-11-12");
	tcbn_manipulate::record_out_proc ($bdb,'t0839',"守谷",62100,"2005-12-21");
}

# ------------------------------------------------------------
#
print "Content-type: text/html\n\n";
#
my $file_in = "/var/tmp/tokyo_cabinet/cities.tcb";

unlink $file_in;

my $bdb = TokyoCabinet::BDB->new();

if(!$bdb->open($file_in, $bdb->OWRITER | $bdb->OCREAT))
{
	my $ecode = $bdb->ecode();
	printf STDERR ("open error: %s\n", $bdb->errmsg($ecode));
}
#
data_out_proc ($bdb);
#
if(!$bdb->close()){
	my $ecode = $bdb->ecode();
	printf STDERR ("close error: %s\n", $bdb->errmsg($ecode));
}
#
chmod (0666,$file_in);
#
print "*** OK ***<p />";
#
# ------------------------------------------------------------
