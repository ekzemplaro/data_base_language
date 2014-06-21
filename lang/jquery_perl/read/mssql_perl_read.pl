#! /usr/bin/perl
#
#	notyet_perl_read.pl
#
#						Jan/26/2011
# --------------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
#
#
# --------------------------------------------------------------------
my $str_aa='{"cities":[{"id":"921","name":"横浜","population":38745,"date_mod":"2005-7-5"},';
$str_aa .= '{"id":922,"name":"川崎","population":26573,"date_mod":"2005-6-12"},';

$str_aa .= '{"id":923,"name":"小田原","population":63218,"date_mod":"2005-9-17"},';

$str_aa .= '{"id":924,"name":"藤沢","population":51348,"date_mod":"2005-12-9"},';

$str_aa .= '{"id":925,"name":"相模原","population":70142,"date_mod":"2005-8-28"},';
$str_aa .= '{"id":926,"name":"厚木","population":14376,"date_mod":"2005-9-15"},';
$str_aa .= '{"id":927,"name":"横須賀","population":47238,"date_mod":"2005-3-21"},';
$str_aa .= '{"id":928,"name":"鎌倉","population":31526,"date_mod":"2005-4-18"},';

$str_aa .= '{"id":929,"name":"逗子","population":49825,"date_mod":"2005-2-21"}]}';
#
#
print "Content-type: text/json\n\n";
print	$str_aa;
#
