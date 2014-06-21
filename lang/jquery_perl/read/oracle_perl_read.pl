#! /usr/bin/perl
#
#	master_perl_read.pl
#
#						Dec/24/2010
# --------------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
#
#
my $str_aa='{"cities":[{"id":"921","name":"横浜","population":"90345","date_mod":"2005-3-17"},';
$str_aa .= '{"id":"922","name":"川崎","population":"72617","date_mod":"2005-6-12"},';

$str_aa .= '{"id":"923","name":"小田原","population":"36321","date_mod":"2005-9-17"},';

$str_aa .= '{"id":"924","name":"藤沢","population":"51348","date_mod":"2005-12-9"},';

$str_aa .= '{"id":"925","name":"相模原","population":"70142","date_mod":"2005-8-28"},';

$str_aa .= '{"id":"926","name":"厚木","population":"49821","date_mod":"2005-2-21"}]}';
#
#
print "Content-type: text/json\n\n";
print	$str_aa;
#
