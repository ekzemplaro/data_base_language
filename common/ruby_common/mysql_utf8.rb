#! /usr/bin/ruby
#
#	mysql_utf8.rb
#
#					Apr/13/2010
#
require	"cgi"
require	"json"
#
# ---------------------------------------------------------------------
def	mysql_utf8_proc	(dbi)
	$sql_str = "SET NAMES utf8";
	dbi.execute($sql_str);
end
# ---------------------------------------------------------------------
