#! /usr/bin/perl
#
#	master_perl_read.pl
#
#
#
#
$str_aa='{"cities":[{"id":"921","name":"横浜","population":"90345","date_mod":"2010-03-12"},';
$str_aa .= '{"id":"922","name":"川崎","population":"72617","date_mod":"2010-01-05"},';

$str_aa .= '{"id":"923","name":"小田原","population":"36321","date_mod":"2010-01-17"},';

$str_aa .= '{"id":"924","name":"藤沢","population":"51348","date_mod":"2010-02-09"},';

$str_aa .= '{"id":"925","name":"相模原","population":"70142","date_mod":"2010-01-28"},';

$str_aa .= '{"id":"926","name":"厚木","population":"49821","date_mod":"2010-03-14"}]}';
#
#
print "Content-type: text/json\n\n";
print	$str_aa;
#
