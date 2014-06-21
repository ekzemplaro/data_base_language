DBXML=/home/uchida/xml_database/berkeley/dbxml-2.5.16
dbxml_read: dbxml_read.cpp
	c++ -o dbxml_read dbxml_read.cpp  \
	-I$(DBXML)/dbxml/include \
	-I$(DBXML)/dbxml/include/dbxml \
	-I$(DBXML)/db-4.8.26/build_unix \
	-L$(DBXML)/install/lib \
	-ldbxml
clean:
	rm -f dbxml_read *.o
