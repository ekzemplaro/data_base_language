#! /usr/bin/perl
#
#	cookie_get.pl
#
use strict;
use warnings;
use CGI::Cookie;
 
my %cookies = fetch CGI::Cookie;

my $message = ""; 
my $aa = ""; 
my $bb = ""; 
my $cc = ""; 
if(exists $cookies{'message'}){ $message  = $cookies{'message'}->value; }
if(exists $cookies{'aa'}){ $aa  = $cookies{'aa'}->value; }
if(exists $cookies{'bb'}){ $bb  = $cookies{'bb'}->value; }
if(exists $cookies{'cc'}){ $cc  = $cookies{'cc'}->value; }
 
print "Content-type: text/html\n\n";
print "<!DOCTYPE html>";
print "<html lang=\"ja\">";
print "<head>";
print '<meta http-equiv="CONTENT-TYPE" content="text/html; charset=utf-8" />';
print "<title>cookie get</title>";
print "</head>";
print "<body>";
print "message: " . $message . "<p />";
print "aa: " . $aa . "<p />";
print "bb: " . $bb . "<p />";
print "cc: " . $cc . "<p />";
print "cookie_get.pl<p />";
print "Aug/14/2020<p/>";
print "</body>";
print "</html>";
