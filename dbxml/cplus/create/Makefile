CPLUS_COMMON=/var/www/data_base/common/cplus_common
DBXML=/home/uchida/xml_database/berkeley/dbxml-2.5.16
dbxml_create: dbxml_create.cpp
	c++ -o dbxml_create dbxml_create.cpp  \
	$(CPLUS_COMMON)/text_manipulate.o \
	-I$(DBXML)/dbxml/include \
	-I$(DBXML)/dbxml/include/dbxml \
	-I$(DBXML)/db-4.8.26/build_unix \
	-L$(DBXML)/install/lib \
	-ldbxml
clean:
	rm -f dbxml_create *.o
