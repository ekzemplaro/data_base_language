#! /usr/bin/perl
#
#	perl_common/xml_manipulate.pm
#
#				May/20/2011
#
# ----------------------------------------------------------------
package xml_manipulate;

use	strict;
use	warnings;
use	utf8;

use XML::DOM;
use XML::Simple;
use text_manipulate;

# ----------------------------------------------------------------
sub xml_to_dict_proc
{
	my ($xml_str) = @_;

	my %dict_aa;

	my $parser = new XML::DOM::Parser;
	my $doc_aa = $parser->parse($xml_str);

	my $nodelist = $doc_aa->getElementsByTagName("name");

	my @arry_ff = ();
	for(my $it = 0 ; $it < $nodelist->getLength; $it++)
	{
	my $node = $nodelist->item($it);
	my $name = $node->getFirstChild->getNodeValue;

	my $parent=$node->getParentNode ();
	my $id = $parent->getTagName ();
#
#	utf8::encode($name);
#	utf8::decode($name);
	my $nn_pp = $parent->getElementsByTagName("population");
	my $population = $nn_pp->item(0)->getFirstChild->getNodeValue;

	my $nn_dd = $parent->getElementsByTagName("date_mod");
	my $date_mod = $nn_dd->item(0)->getFirstChild->getNodeValue;

	%dict_aa=text_manipulate::dict_append_proc
		($id,$name,$population,$date_mod,%dict_aa);
	}

	return	%dict_aa;
}

# ----------------------------------------------------------------
sub dict_to_xml_proc
{
	my %dict_aa = @_;
foreach my $key (sort keys %dict_aa){
		if (($key ne '_id') && ($key ne '_rev'))
			{
		my $out_str = $key . "\t";
		$out_str .=  ${$dict_aa{$key}}{"name"} . "\t";
		$out_str .= ${$dict_aa{$key}}{"population"} . "\t";
		$out_str .= ${$dict_aa{$key}}{"date_mod"} . "\n";
#		print (encode ('utf-8',$out_str));
#		print $out_str;
			}
	}

	my $xml = new XML::Simple (NoAttr=>1, RootName=>'root');

	my $xml_data = $xml->XMLout(\%dict_aa);
#	my $xml_str = '<?xml version=\"1.0\"?>' . "\n" . $xml_data;
	my $xml_str = '<?xml version="1.0"?>' . "\n" . $xml_data;

	return	$xml_str;
}

# ----------------------------------------------------------------
sub file_to_doc_proc
{
	my $fname_in = $_[0];
#	print	("*** file_to_doc_proc *** start *** $fname_in\n");


	my $size = -s $fname_in;
	open (IN_FL ,"$fname_in");
	read(IN_FL,my $xml,$size);
	close IN_FL;
#
	my $parser = new XML::DOM::Parser;
	my $doc_bb = $parser->parse($xml);
#	print	("*** file_to_doc_proc *** end ***\n");

	return	$doc_bb;
}

# ----------------------------------------------------------------
sub doc_display_proc
{
	my $doc_mm = $_[0];

#	print	("*** doc_display_proc *** start ***\n");

	my $data = doc_to_array_proc ($doc_mm);

	text_manipulate::array_display_proc ($data);
#
#	print	("*** doc_display_proc *** end ***\n");
}
# ----------------------------------------------------------------
sub doc_to_array_proc
{
	my $doc=$_[0];

	my $nodelist = $doc->getElementsByTagName("cities");

	my @arry_ff = ();
	for(my $it = 0 ; $it < $nodelist->getLength; $it++)
	{
	my $node = $nodelist->item($it);
	my $id = $node->getElementsByTagName("id")->item(0)->getFirstChild->getNodeValue;
	my $name = $node->getElementsByTagName("name")->item(0)->getFirstChild->getNodeValue;
	my $population = $node->getElementsByTagName("population")->item(0)->getFirstChild->getNodeValue;
	my $date_mod = $node->getElementsByTagName("date_mod")->item(0)->getFirstChild->getNodeValue;

#
#	utf8::encode($name);
	utf8::decode($name);

		my $unit_aa = {id=>$id,
		name=>$name,
		population=>$population,
		date_mod=>$date_mod};
		push (@arry_ff,$unit_aa);
	}

	my $data = {'cities' => [@arry_ff]};
	return	$data;
}
#
# ----------------------------------------------------------------
sub doc_update_proc
{
	my ($id_in,$population_in,$doc_in) = @_;
#
	my $date_mod_new = text_manipulate::get_date_mod_proc ();
#
	my $nodelist = $doc_in->getElementsByTagName("cities");
	for(my $it = 0 ; $it < $nodelist->getLength; $it++)
	{
	my $node = $nodelist->item($it);
	my $id = $node->getElementsByTagName("id")->item(0)->getFirstChild->getNodeValue;
	my $population = $node->getElementsByTagName("population")->item(0)->getFirstChild->getNodeValue;

	if ($id_in == $id)
		{
	print	("*** $id_in\t$population_in\n");
	$node->getElementsByTagName("population")->item(0)->getFirstChild->setNodeValue ($population_in);
	$node->getElementsByTagName("date_mod")->item(0)->getFirstChild->setNodeValue ($date_mod_new);
		}
	}
}

# ----------------------------------------------------------------
sub doc_delete_proc
{
	my ($id_in,$doc_in) = @_;
	my $document_root = $doc_in->getDocumentElement ();
#
	my $nodelist = $doc_in->getElementsByTagName("cities");
	for(my $it = 0 ; $it < $nodelist->getLength; $it++)
	{
	my $node = $nodelist->item($it);
	my $id = $node->getElementsByTagName("id")->item(0)->getFirstChild->getNodeValue;

	if ($id_in == $id)
		{
		print	("*** remove *** $id_in\n");
		$document_root->removeChild ($node);
		}
	}
}

# ----------------------------------------------------------------
1;
#
# ----------------------------------------------------------------
