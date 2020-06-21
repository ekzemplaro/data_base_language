#!/usr/bin/perl
#
use CGI;
my $qq = new CGI;
print $qq->header(-charset=>"utf-8");
print $qq->start_html(-title=>"Perl CGI のテスト", -BGCOLOR=>'#ffffff'),
    $qq->center($qq->h1('Perl CGI のテスト')),
    $qq->hr,
    $qq->ul(
        $qq->li('Python3'),
        $qq->li('Node.js'),
        $qq->li('Ruby'),
        $qq->li('PHP'),
        $qq->li('Perl')
    ),
    $qq->br,
    $qq->br,
    $qq->a({href=>"https://ekzemplaro.org/"}, "トップページ"),
    $qq->br,
    $qq->br,
    $qq->strong("Jun/20/2020"),
    $qq->end_html;
exit;
