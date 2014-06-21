#! /usr/bin/perl
#
use CGI;
use XML::DOM;

			#################################
			#	file read=＞$xml	    #
			#################################
$fname = "sample02.xml";	#File Name
$size = -s $fname;
open (IN_FL ,"$fname");
read(IN_FL,$xml,$size);
close IN_FL;

			#################################
			#	Command Get	    #
			#################################
$parser = new XML::DOM::Parser;
$doc = $parser->parse($xml);
$nodelist = $doc->getElementsByTagName("command");

			#################################
			#	Do Command	    #
			#################################
print "Content-Type: text/plain\n\n";

for($it = 0 ; $it < $nodelist->getLength; $it++)
{
	$node = $nodelist->item($it);
	$cmd = $node->getElementsByTagName("line")->item(0)->getFirstChild->getNodeValue;

	print $cmd . "\n";
}
#
