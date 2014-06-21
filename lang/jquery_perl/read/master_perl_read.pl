#! /usr/bin/perl
#
#	master_perl_read.pl
#
#						Jun/07/2011
# --------------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
#
#
# --------------------------------------------------------------------
my $str_aa='{"t0421": {"name":"仙台","population":38745,"date_mod":"2005-7-5"},';
$str_aa .= '"t0422": {"name":"石巻","population":26573,"date_mod":"2005-6-12"},';

$str_aa .= '"t0423": {"name":"塩竈","population":63218,"date_mod":"2005-9-17"},';

$str_aa .= '"t0424": {"name":"気仙沼","population":51348,"date_mod":"2005-12-9"},';

$str_aa .= '"t0425": {"name":"白石","population":78651,"date_mod":"2005-8-28"},';
$str_aa .= '"t0426": {"name":"名取","population":14376,"date_mod":"2005-9-15"},';
$str_aa .= '"t0427": {"name":"多賀城","population":47238,"date_mod":"2005-3-21"},';
$str_aa .= '"t0428": {"name":"岩沼","population":31526,"date_mod":"2005-4-18"},';

$str_aa .= '"t0429": {"name":"大崎","population":49825,"date_mod":"2005-2-21"}}';
#
#
print "Content-type: text/json\n\n";
print	$str_aa;
#
