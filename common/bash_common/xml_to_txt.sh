#! /bin/bash
#
#	bash_common/xml_to_txt.sh
#
#					Nov/19/2014
#
file_xsl=/var/www/data_base/common/bash_common/xsl_files/xml_to_txt_cities.xsl
#
#xalan -xsl $file_xsl | awk '{if (2 < NF) print $1,$2,$3,$4}'
Xalan $1 $file_xsl | awk '{if (2 < NF) print $1,$2,$3,$4}'
#
