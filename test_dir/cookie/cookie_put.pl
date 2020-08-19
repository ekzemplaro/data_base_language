#! /usr/bin/perl
#
#	cookie_put.pl
#
use strict;
use warnings;
#
print "Set-Cookie: message='Good Morning';\n";
print "Set-Cookie: aa='おはようございます。';\n";
print "Set-Cookie: bb=Test_bb;\n";
print "Set-Cookie: cc=Test_cc;\n";
print 'Content-Type: text/html',"\n";
print "\n";
print "\n";
print "<!DOCTYPE html>";
print "<html lang=\"ja\">";
print "<head>";
print "<title>cookie put</title>";
print "</head>";
print "<body>";
print "cookie_put.pl<p />";
print "Aug/14/2020<p/>";
print "</body>";
print "</html>";
