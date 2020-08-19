#! /usr/bin/perl
#
#	cookie_counter.pl
#
#
use strict;

my $now_cookie = $ENV{"HTTP_COOKIE"};
my $new_cookie = $now_cookie + 1;

print "Content-type: text/html\n";
print "Set-Cookie: $new_cookie\n";
print "\n";
print "<!DOCTYPE html>";
print "<html lang=\"ja\">";
print "<head>";
print '<meta http-equiv="CONTENT-TYPE" content="text/html; charset=utf-8" />';
print "<title>";
print "Cookie Counter";
print "</title>";
print "</head>";
print "<body>";

print "$new_cookie<br />";
print "（リロードしてください）<p />";
print "Aug/14/2020<p/>";
print "</body>";
print "</html>";
