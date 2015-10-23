#
#	cgi_manipulate.py
#
#					Aug/04/2014
#
import	math
import	cgi
import	string
import	sys
#
import	json
#
# ---------------------------------------------------------------
#
def	parse_parameter ():
	ff=cgi.FieldStorage ()
#
	my_data = ff.getfirst ("my_data","")
#
	print ("my_data = " + my_data + ":<p />\n")
#
	json_str = my_data;
	print ("json_str = " + json_str + "<br />")
	array_bb = json.loads (json_str)
#
	print ("len(array_bb) = %d<p />\n" % len(array_bb))
#
	return	array_bb
# ---------------------------------------------------------------
